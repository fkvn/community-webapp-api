package mono.thainow.rest.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.annotation.AdminAndSAdminAccess;
import mono.thainow.annotation.AuthorizedAccess;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.rest.request.UserUpdateInfoRequest;
import mono.thainow.service.ProfileService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/profiles/users/{profileId}")
public class UserProfileController {

	@Autowired
	private ProfileService profileService;

	@Autowired
	private UserService userService;

	@Autowired
	private StorageService storageService;

//	validate access and return profile
	private UserProfile getValidUserProfile(Long profileId, boolean authorizedOnly) {

		UserProfile profile = profileService.getValidUserProfile(profileId);

		if (authorizedOnly) {
			UserDetailsImpl userDetails = AuthUtil.getAuthorizedUser();

			if (!profile.getAccount().getId().equals(userDetails.getId())) {
				throw new AccessForbidden();
			}
		}

		return profile;
	}

	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public UserProfile getUserProfile(@PathVariable Long profileId) {

		UserProfile profile = getValidUserProfile(profileId, false);

//		anonymousUser -> public request
		if (AuthUtil.getAuthorizedUser() == null) {

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

	@PatchMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	@AuthorizedAccess
	public UserProfile updateUserProfile(@PathVariable Long profileId,
			@Valid @RequestBody UserUpdateInfoRequest userUpdateInfoRequest) {
//		Map<String, Object> res = new HashMap<>();

		UserProfile profile = getValidUserProfile(profileId, true);

//		update user
		User account = profile.getAccount();
		account = userService.getUserFromUpdateInfoRequest(account, userUpdateInfoRequest);
		account = userService.saveUser(account);

		return profile;
	}

	@DeleteMapping
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthorizedAccess
	public void removeUserProfile(@PathVariable Long profileId) {

		UserProfile profile = getValidUserProfile(profileId, true);

		profileService.removeProfile(profile);

	}

	@PostMapping("/picture")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthorizedAccess
	public Storage uploadProfile(@PathVariable Long id, @Valid @RequestBody StorageRequest newPicture) {

//		get profile
		UserProfile profile = getValidUserProfile(id, true);

//		get storage
		Storage picture = storageService.getStorageFromStorageRequest(newPicture);
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

	@PatchMapping("/activate")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	public UserProfile activateCompanyProfile(@PathVariable Long profileId) {

		UserProfile profile = (UserProfile) profileService.getProfile(profileId);

		profile = profileService.activateProfile(profile);

		return profile;

	}

	@PatchMapping("/disable")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	public UserProfile blockCompanyProfule(@PathVariable Long profileId) {

		UserProfile profile = (UserProfile) profileService.getProfile(profileId);

		profile = profileService.blockProfile(profile);

		return profile;

	}
}
