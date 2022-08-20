package mono.thainow.rest.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

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

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/profiles/users/{id}")
public class UserProfileController {

	@Autowired
	private ProfileService profileService;

	@Autowired
	private UserService userService;

	@Autowired
	private StorageService storageService;
	
//	user binded the access_token
	private UserDetailsImpl getAuthorizedUser() {
		return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

//	validate access and return profile
	private UserProfile getProfile(Long id) {

		UserProfile profile = profileService.getUserProfile(id);
		
		UserDetailsImpl userDetails = getAuthorizedUser();

		if (!profile.getAccount().getId().equals(userDetails.getId())) {
			throw new AccessForbidden();
		}
		
		return profile;
	}
	
	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Map<String, Object> getUserProfile(@PathVariable Long id) {
		Map<String, Object> res = new HashMap<>();

		UserProfile profile = getProfile(id);

		res.put("basicInfo", profile);
		res.put("detailInfo", profile.getAccount());

		return res;
	}

	@PatchMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Map<String, Object> updateUserProfile(@PathVariable Long id,
			@Valid @RequestBody UserUpdateInfoRequest userUpdateInfoRequest) {
		Map<String, Object> res = new HashMap<>();

		UserProfile profile = getProfile(id);

//		update user
		User account = profile.getAccount();
		account = userService.getUserFromUpdateInfoRequest(account, userUpdateInfoRequest);
		account = userService.saveUser(account);

//		update Profile
		profile.setProfileInfo(account);
		profile = (UserProfile) profileService.saveProfile(profile);

//		return values
		res.put("basicInfo", profile);
		res.put("detailInfo", profile.getAccount());

		return res;
	}
	
	@DeleteMapping
	@ResponseStatus(HttpStatus.OK)
	public void removeUserProfile(@PathVariable Long id) {

		UserProfile profile = getProfile(id);
		
		profileService.removeUserProfile(profile);

	}
	
	@PostMapping("/picture")
	@ResponseStatus(HttpStatus.CREATED)
	public Storage uploadProfile(@PathVariable Long id, @Valid @RequestBody StorageRequest newPicture) {
		
//		get profile
		UserProfile profile = getProfile(id);
		
//		get storage
		Storage picture = storageService.getStorageFromStorageRequest(newPicture);
		picture = storageService.saveStorage(picture);
		
//		update account
		User account = profile.getAccount();
		account.setPicture(picture);
		account = userService.saveUser(account);
		
//		update profile
		profile.setProfileInfo(account);
		profile = (UserProfile) profileService.saveProfile(profile);
		
		return picture;
	}

}
