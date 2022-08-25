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
import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.rest.request.CompanyRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
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

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	@JsonView(View.Basic.class)
	public Profile addCompanyProfile(@Valid @RequestBody CompanyRequest companyRequest) {

		Company company = companyService.createCompany(companyRequest);

		User account = userService.getByUserId(AuthUtil.getAuthenticatedUser().getId());
		account.setRole(UserRole.BUSINESS);
		account = userService.saveUser(account);

		return profileService.createProfile(account, company);
	}

	@GetMapping("/{profileId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public CompanyProfile getCompanyProfile(@PathVariable Long profileId) {

		CompanyProfile profile = profileService.getValidCompanyProfile(profileId);

//		anonymousUser -> public request
		if (AuthUtil.getAuthenticatedUser() == null) {

			Company company = profile.getCompany();

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

			profile.setCompany(company);

		}

		return profile;
	}

	@PatchMapping("/{profileId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@AuthenticatedAccess
	public CompanyProfile updateCompanyProfile(@PathVariable Long profileId,
			@Valid @RequestBody CompanyRequest request) {

		CompanyProfile profile = profileService.getValidCompanyProfile(profileId);
		
		AuthUtil.authorizedAccess(profile, true);

//		update company
		Company company = profile.getCompany();
		company = companyService.getCompanyFromUpdateRequest(company, request);
		company = companyService.saveCompany(company);

		return profile;
	}

	@DeleteMapping("/{profileId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void removeCompanyProfile(@PathVariable Long profileId) {

		CompanyProfile profile = profileService.getValidCompanyProfile(profileId);
		
		AuthUtil.authorizedAccess(profile, true);

//		disable company profile 
		profileService.removeProfile(profile);

//		if no company profiles relates to the account
		if (profileService.getValidCompanyProfiles(profile.getAccount()).size() == 0) {
//			update role
			profile.getAccount().setRole(UserRole.CLASSIC);
			userService.saveUser(profile.getAccount());
		}

	}

	@PostMapping("/{profileId}/picture")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Storage uploadCompanyProfile(@PathVariable Long profileId, @Valid @RequestBody StorageRequest newPicture) {

//		get profile
		CompanyProfile profile = profileService.getValidCompanyProfile(profileId);
		
		AuthUtil.authorizedAccess(profile, true);

//		get storage
		Storage logo = storageService.getStorageFromStorageRequest(newPicture);
		logo = storageService.saveStorage(logo);

//		update account
		Company company = profile.getCompany();
		company.setLogo(logo);
		company = companyService.saveCompany(company);

		return logo;
	}

	@PatchMapping("/{profileId}/activate")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	public CompanyProfile activateCompanyProfile(@PathVariable Long profileId) {

		CompanyProfile profile = (CompanyProfile) profileService.getProfile(profileId);

		profile = profileService.activateProfile(profile);

		return profile;

	}

	@PatchMapping("/{profileId}/disable")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	public CompanyProfile disableCompanyProfile(@PathVariable Long profileId) {

		CompanyProfile profile = (CompanyProfile) profileService.getProfile(profileId);

		profile = profileService.disableProfile(profile);

		return profile;

	}
}