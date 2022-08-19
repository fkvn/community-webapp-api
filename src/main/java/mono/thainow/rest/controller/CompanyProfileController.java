package mono.thainow.rest.controller;

import java.util.HashMap;
import java.util.List;
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

import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.CompanySignupRequest;
import mono.thainow.rest.request.CompanyUpdateInfoRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;
import mono.thainow.service.impl.UserDetailsImpl;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/profiles/companies")
public class CompanyProfileController {

	@Autowired
	private ProfileService profileService;

	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private StorageService storageService;
	
//	user binded the access_token
	private UserDetailsImpl getAuthorizedUser() {
		return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	private CompanyProfile getProfile(Long id) {

		CompanyProfile profile = profileService.getCompanyProfile(id);
		
		UserDetailsImpl userDetails = getAuthorizedUser();

		if (!profile.getAccount().getId().equals(userDetails.getId())) {
			throw new AccessForbidden();
		}
		
		return profile;
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Profile addCompanyProfile(@Valid @RequestBody CompanySignupRequest companyRequest) {
		User account = userService.getActiveUserBySub(getAuthorizedUser().getSub());
		account.setRole(UserRole.BUSINESS);
		account = userService.saveUser(account);
		
		Company company = companyService.createCompany(companyRequest);

		return profileService.createProfile(account, company);
	}
	
	@GetMapping("/{id}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Map<String, Object> getCompanyProfile(@PathVariable Long id) {
		Map<String, Object> res = new HashMap<>();

		CompanyProfile profile = getProfile(id);

		Company company = companyService.getCompanyById(profile.getCompanyId());

		res.put("basicInfo", profile);
		res.put("detailInfo", company);

		return res;
	}
	
	@PatchMapping("/{id}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Map<String, Object> updateCompanyProfile(@PathVariable Long id,
			@Valid @RequestBody CompanyUpdateInfoRequest companyUpdateInfoRequest) {
		Map<String, Object> res = new HashMap<>();

		CompanyProfile profile = getProfile(id);

//		update company
		Company company = companyService.getCompanyById(profile.getCompanyId());
		company = companyService.getCompanyFromUpdateInfoRequest(company, companyUpdateInfoRequest);
		company = companyService.saveCompany(company);

//		update Profile
		profile.setProfileInfo(company);
		profile = (CompanyProfile) profileService.saveProfile(profile);

//		return values
		res.put("basicInfo", profile);
		res.put("detailInfo", company);

		return res;
	}
	
	@DeleteMapping("/user/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void removeUserProfile(@PathVariable Long id) {

		CompanyProfile profile = getProfile(id);

//		disable profiles
		List<Profile> profiles = profileService.getAllProfiles(profile.getAccount());
		profiles.forEach(prof -> {

//			disable company
			if (prof.getDecriminatorValue().equals("COMPANY_PROFILE")) {
				companyService.remove(companyService.getCompanyById(((CompanyProfile) prof).getCompanyId()));
			}

//			disable profile
			profileService.remove(prof);
		});

//		disable account
		userService.remove(profile.getAccount());

	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.OK)
	public void removeCompanyProfile(@PathVariable Long id) {

		CompanyProfile profile = getProfile(id);
		
//		disable company
		companyService.remove(companyService.getCompanyById(profile.getCompanyId()));
		
//		disable profile
		profile = (CompanyProfile) profileService.remove(profile);
		
//		no company profiles relates to the account
		if (profileService.getProfiles(profile.getAccount()).size() == 1) {
//			update role
			profile.getAccount().setRole(UserRole.CLASSIC);
			userService.saveUser(profile.getAccount());
		}
		
	}

	@PostMapping("/{id}/picture")
	@ResponseStatus(HttpStatus.CREATED)
	public Storage uploadProfile(@PathVariable Long id, @Valid @RequestBody StorageRequest newPicture) {
		
//		get profile
		CompanyProfile profile = getProfile(id);
		
//		get storage
		Storage picture = storageService.getStorageFromStorageRequest(newPicture);
		picture = storageService.saveStorage(picture);
		
//		update account
		Company company = companyService.getCompanyById(profile.getCompanyId());
		company.setLogo(picture);
		company = companyService.saveCompany(company);
		
//		update profile
		profile.setProfileInfo(company);
		profile = (CompanyProfile) profileService.saveProfile(profile);
		
		return picture;
	}

}
