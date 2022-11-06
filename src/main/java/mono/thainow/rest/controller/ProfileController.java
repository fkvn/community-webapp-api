package mono.thainow.rest.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.profile.BusinessProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.ProfileType;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
@RequestMapping("/api/profiles")
public class ProfileController {

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
	@AuthenticatedAccess
	@JsonView(View.Basic.class)
	public List<Profile> getProfiles() {
		return profileService.findProfilesByAccountId(AuthUtil.getAuthenticatedUser().getId());
	}

	@GetMapping("/{profileId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public Profile findProfile(@PathVariable Long profileId) {

		Profile profile = profileService.findProfileById(profileId);

//		anonymousUser -> public request
		if (AuthUtil.getAuthenticatedUser() == null) {

			if (profile.getType() == ProfileType.USER_PROFILE) {

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

			} else if (profile.getType() == ProfileType.BUSINESS_PROFILE) {
				Company company = ((BusinessProfile) profile).getCompany();

				if (!company.isEmailPublic())
					company.setEmail(null);
				if (!company.isPhonePublic())
					company.setPhone(null);
				if (!company.isDescriptionPublic())
					company.setDescription(null);
				if (!company.isWebsitePublic())
					company.setWebsite(null);
				if (!company.isSizePublic())
					company.setSize(null);

				((BusinessProfile) profile).setCompany(company);
			}
		}

//		authorized request
		else if (!AuthUtil.isAdminAuthenticated()) {
			if (profile.getType() == ProfileType.USER_PROFILE) {
				Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED, "Invalid Profile!");
			} else if (profile.getType() == ProfileType.BUSINESS_PROFILE) {
				Assert.isTrue(((BusinessProfile) profile).getCompany().getStatus() == CompanyStatus.REGISTERED,
						"Profile is NOT registered!");
			}
		}

		return profile;

	}

	
	@PostMapping("/{profileId}/picture")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Storage uploadProfilePicture(@PathVariable Long profileId,
			@Valid @RequestBody StorageRequest newPicture) {

		Profile profile = profileService.findProfileById(profileId);
		
		AuthUtil.authorizedAccess(profile, true);

		if (!AuthUtil.isAdminAuthenticated()) {
			if (profile.getType() == ProfileType.USER_PROFILE) {
				Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED, "Invalid Profile!");
			} else if (profile.getType() == ProfileType.BUSINESS_PROFILE) {
				Assert.isTrue(((BusinessProfile) profile).getCompany().getStatus() == CompanyStatus.REGISTERED,
						"Profile is NOT registered!");
			}
		}
		
//		get storage
		Storage picture = storageService.fetchStorageFromRequest(newPicture);
		picture = storageService.saveStorage(picture);

		if (profile.getType() == ProfileType.USER_PROFILE) {
//			update account picture
			User account = profile.getAccount();
			account.setPicture(picture);
			account = userService.saveUser(account);
			
		} else if (profile.getType() == ProfileType.BUSINESS_PROFILE) {
//			update company logo
			Company company = ((BusinessProfile) profile).getCompany();
			company.setLogo(picture);
			company = companyService.saveCompany(company);
		}
		
		return picture;
	}

	
	@PostMapping("/{requesterId}/block/posts/{postId}")
	@AuthenticatedAccess
	public void blockPost(@PathVariable Long requesterId, @PathVariable Long postId) {
		profileService.blockPost(requesterId, postId);
	}
	
	@PostMapping("/{requesterId}/unblock/posts/{postId}")
	@AuthenticatedAccess
	public void unBlockPost(@PathVariable Long requesterId, @PathVariable Long postId) {
		profileService.unBlockPost(requesterId, postId);
	}

}
