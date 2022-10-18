package mono.thainow.rest.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.profile.BusinessProfile;
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
@RequestMapping("/api/profiles/business")
public class BusinessProfileController {

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
	public void addBusinessProfile(@Valid @RequestBody CompanyRequest companyRequest) {

		Company company = companyService.createCompany(companyRequest);

		User account = userService.findActiveUserById(AuthUtil.getAuthenticatedUser().getId());

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


//	@GetMapping("/{profileId}")
//	@ResponseStatus(HttpStatus.ACCEPTED)
//	@JsonView(View.Detail.class)
//	public BusinessProfile findBusinessProfile(@PathVariable Long profileId) {
//
//		BusinessProfile profile = (BusinessProfile) profileService.findProfileById(profileId);
//
//		if (!AuthUtil.isAdminAuthenticated()) {
//			Assert.isTrue(profile.getCompany().getStatus() == CompanyStatus.REGISTERED, "Profile is NOT registered!");
//		}
//
////		anonymousUser -> public request
//		if (AuthUtil.getAuthenticatedUser() == null) {
//
//			Company company = profile.getCompany();
//
//			if (!company.isEmailPublic())
//				company.setEmail(null);
//			if (!company.isPhonePublic())
//				company.setPhone(null);
//			if (!company.isDescriptionPublic())
//				company.setDescription(null);
//			if (!company.isWebsitePublic())
//				company.setWebsite(null);
//			if (!company.isSizePublic())
//				company.setSize(null);
//
//			profile.setCompany(company);
//
//		}
//
//		return profile;
//	}

	@PatchMapping("/{profileId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@AuthenticatedAccess
	public BusinessProfile updateBusinessProfile(@PathVariable Long profileId,
			@Valid @RequestBody CompanyRequest request) {

		BusinessProfile profile = (BusinessProfile) profileService.findProfileById(profileId);

		if (!AuthUtil.isAdminAuthenticated()) {
			Assert.isTrue(profile.getCompany().getStatus() == CompanyStatus.REGISTERED, "Profile is NOT registered!");
		}

		AuthUtil.authorizedAccess(profile, true);

//		update company
		Company company = profile.getCompany();
		company = companyService.fetchCompanyFromUpdateRequest(company, request);
		company = companyService.saveCompany(company);

		return profile;
	}

	@DeleteMapping("/{profileId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void removeBusinessProfile(@PathVariable Long profileId) {

		BusinessProfile profile = (BusinessProfile) profileService.findProfileById(profileId);

		if (!AuthUtil.isAdminAuthenticated()) {
			Assert.isTrue(
					profile.getCompany().getStatus() == CompanyStatus.REGISTERED
							|| profile.getCompany().getStatus() == CompanyStatus.DISABLED,
					"Profile cannot be removed!");
		}

//		disable company profile 
		profileService.removeBusinessProfile(profile);

//		if no company profiles relates to the account
		if (profileService.findBusinessProfilesByAccount(profile.getAccount()).size() == 0) {

//			update role
			if (profile.getAccount().getRole() == UserRole.BUSINESS) {
				profile.getAccount().setRole(UserRole.CLASSIC);
				userService.saveUser(profile.getAccount());
			}
		}
	}

	@PostMapping("/{profileId}/picture")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Storage uploadBusinessProfilePicture(@PathVariable Long profileId,
			@Valid @RequestBody StorageRequest newPicture) {

		BusinessProfile profile = (BusinessProfile) profileService.findProfileById(profileId);

		if (!AuthUtil.isAdminAuthenticated()) {
			Assert.isTrue(profile.getCompany().getStatus() == CompanyStatus.REGISTERED, "Profile is NOT registered!");
		}

		AuthUtil.authorizedAccess(profile, true);

//		get storage
		Storage logo = storageService.fetchStorageFromRequest(newPicture);
		logo = storageService.saveStorage(logo);

//		update account
		Company company = profile.getCompany();
		company.setLogo(logo);
		company = companyService.saveCompany(company);

		return logo;
	}

	@PatchMapping("/{profileId}/activate")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void activateBusinessProfile(@PathVariable Long profileId) {

		BusinessProfile profile = (BusinessProfile) profileService.findProfileById(profileId);

		profile = profileService.activateBusinessProfile(profile);

	}

	@PatchMapping("/{profileId}/disable")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void disableBusinessProfile(@PathVariable Long profileId) {

		BusinessProfile profile = (BusinessProfile) profileService.findProfileById(profileId);

		profile = profileService.disableBusinessProfile(profile);

	}
}
