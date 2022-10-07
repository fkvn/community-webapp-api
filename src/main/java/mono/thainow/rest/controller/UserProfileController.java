package mono.thainow.rest.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.annotation.AdminAndSAdminAccess;
import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.rest.request.UserRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/profiles/users")
public class UserProfileController {

	@Autowired
	private ProfileService profileService;

	@Autowired
	private UserService userService;

	@Autowired
	private StorageService storageService;

	
	@Autowired
	private CompanyService companyService;
	
	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public UserProfile getUserProfile(@PathVariable Long profileId) {

		UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

		if (!AuthUtil.isAdminAuthenticated()) {
			Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED, "Invalid Profile!");
		}

//		anonymousUser -> public request
		if (AuthUtil.getAuthenticatedUser() == null) {

			User user = profile.getAccount();

			if (!user.isEmailPublic())
				user.setEmail(null);
			if (!user.isPhonePublic())
				user.setPhone(null);
			if (!user.isDescriptionPublic())
				user.setDescription(null);
			if (!user.isWebsitePublic())
				user.setWebsite(null);

			profile.setAccount(user);

		}

		return profile;
	}

	
	@PostMapping("/{userId}")
	@ResponseStatus(HttpStatus.CREATED)
	@AdminAndSAdminAccess
	@JsonView(View.Basic.class)
	public Long createUserProfileByUserId(@PathVariable Long userId) {
		User user = userService.findUserById(userId);
		
		Assert.isTrue(user.getStatus() == UserStatus.DELETED, "The account has existed!");
		
		user = userService.activateUser(user);
		
		Profile userProfile = profileService.createUserProfile(user);
		
		return userProfile.getId();
	}
	
	@PatchMapping("/{profileId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@JsonView(View.Basic.class)
	@AuthenticatedAccess
	public void updateUserProfile(@PathVariable Long profileId, @Valid @RequestBody UserRequest request) {

		UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

		if (!AuthUtil.isAdminAuthenticated()) {
			Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED, "Invalid Profile!");
		}

		AuthUtil.authorizedAccess(profile, true);

//		update user
		User account = profile.getAccount();
		account = userService.fetchUserFromUpdateRequest(account, request);
		account = userService.saveUser(account);
	}

	@DeleteMapping("/{profileId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void removeUserProfile(@PathVariable Long profileId,
			@RequestParam(defaultValue = "true") boolean removeAccount) {

		UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

		if (!AuthUtil.isAdminAuthenticated()) {
			Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED, "Invalid Profile!");
		}

		AuthUtil.authorizedAccess(profile, true);

		profileService.removeProfile(profile, removeAccount);

	}

	@PostMapping("(/{profileId}/picture")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Storage uploadProfile(@PathVariable Long profileId, @Valid @RequestBody StorageRequest newPicture) {

//		get profile
		UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

		if (!AuthUtil.isAdminAuthenticated()) {
			Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED, "Invalid Profile!");
		}

		AuthUtil.authorizedAccess(profile, true);

//		get storage
		Storage picture = storageService.fetchStorageFromRequest(newPicture);
		picture = storageService.saveStorage(picture);

//		update account
		User account = profile.getAccount();
		account.setPicture(picture);
		account = userService.saveUser(account);

//		update profile
		profile.setAccount(account);
		profile = (UserProfile) profileService.saveProfile(profile);

		return picture;
	}

	@PatchMapping("/{profileId}/activate")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void activateUserProfile(@PathVariable Long profileId) {

		UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

		profileService.activateUserProfile(profile);
	}

	@PatchMapping("/{profileId}/disable")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void disableUserProfile(@PathVariable Long profileId) {

		UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

		profileService.disableUserProfile(profile);

	}


	@PostMapping("/{profileId}/business/{companyId}")
	@ResponseStatus(HttpStatus.CREATED)
	@AdminAndSAdminAccess
	@JsonView(View.Basic.class)
	public void addBusinessProfileByCompany(@PathVariable Long profileId, @PathVariable Long companyId) {

		Company company = companyService.findCompanyById(companyId);
		
		Assert.isTrue(company.getStatus() == CompanyStatus.REJECTED, "This business is existed!");
		
		company = companyService.activateCompany(company);

		User account = profileService.findProfileById(profileId).getAccount();

		try {
			profileService.createBusinessProfile(account, company);

			if (account.getRole() == UserRole.CLASSIC) {
				account.setRole(UserRole.BUSINESS);
				account = userService.saveUser(account);
			}

		} catch (Exception e) {
			companyService.remove(company);
			throw e;
		}

	}

}
