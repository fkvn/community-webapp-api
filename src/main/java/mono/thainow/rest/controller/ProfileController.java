package mono.thainow.rest.controller;

import java.util.HashMap;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.user.User;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.CompanySignupRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.UserService;
import mono.thainow.service.impl.UserDetailsImpl;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/profiles")
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	@Autowired
	private UserService userService;

	@Autowired
	private CompanyService companyService;

//	user binded the access_token
	private UserDetailsImpl getAuthorizedUser() {
		return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	private void validateUserAccess(Long id) {

		UserDetailsImpl userDetails = getAuthorizedUser();

		if (!id.equals(userDetails.getId())) {
			throw new AccessForbidden();
		}
	}
	
	@GetMapping("/{id}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Map<String, Object> getProfile(@PathVariable Long id) {
		Map<String, Object> res = new HashMap<>();
		
		Profile profile = profileService.getProfile(id);
		
		Assert.isTrue(profile != null, "No record found");
		
		validateUserAccess(profile.getAccount().getId());
		
		res.put("basicInfo", profile);
		
		if (profile.getDecriminatorValue().equals("USER_PROFILE") ) {
			res.put("detailInfo", profile.getAccount());
		}
		
		if (profile.getDecriminatorValue().equals("COMPANY_PROFILE") ) {
			Company company =  companyService.getCompanyById(((CompanyProfile) profile).getCompanyId());
			res.put("detailInfo", company);
		}
		
		return res;
	}

	@PostMapping("/companies")
	@ResponseStatus(HttpStatus.CREATED)
	public Profile addCompanyProfile(@Valid @RequestBody CompanySignupRequest companyRequest) {
		User account = userService.getActiveUserBySub(getAuthorizedUser().getSub());
		Company company = companyService.createCompany(companyRequest);

		return profileService.createProfile(account, company);
	}

}
