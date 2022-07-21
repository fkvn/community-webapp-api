package mono.thainow.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.storage.Storage;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.CompanySignupRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.view.View;

@RestController
//@PreAuthorize("hasAnyAuthority('COMPANY_MANAGE')")
@RequestMapping("/api/companies")
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	private void validateCompanyAccess(Long id) {
		
		Company company = companyService.getCompanyById(id);
		
//		user binded the access_token
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		if (!company.getAdministrator().getId().equals(userDetails.getId())) {
			throw new AccessForbidden();
		}
	}
	
	@GetMapping("/{id}")
	@JsonView(View.Company.Basic.class)
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Company getCompany(@PathVariable Long id) {
		validateCompanyAccess(id);
		return companyService.getCompanyById(id);
	}
	
	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<Company> getAllCompanies() {
		return companyService.getAllCompanies();
	}
	
	@PostMapping("/{id}/logo")
	@ResponseStatus(HttpStatus.CREATED)
	public Storage uploadProfile(@PathVariable Long id, @RequestParam("file") MultipartFile file) {
		
		validateCompanyAccess(id);
		
		Company company = companyService.getCompanyById(id);

		Storage profile  = companyService.uploadLogoPicture(company, file);

		return profile;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Company createCompany(@RequestBody CompanySignupRequest compRequest) {		
		return companyService.createCompany(compRequest);
	}

	@PutMapping("{id}/status")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Company updateCompanyStatus(@PathVariable Long id, @RequestParam String newStatus) {

		Company company = companyService.getCompanyById(id);

//		if newstatus, if old status, no change
		if (CompanyStatus.valueOf(newStatus) != company.getStatus()) {
			return companyService.updateCompanyStatus(company, CompanyStatus.valueOf(newStatus));
		}

		return company;
	}

	@GetMapping("/searchName")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<Company> updateCompanyStatus(@RequestParam String keywords, @RequestParam boolean fetchAll,
			@RequestParam int fetchLimit) {

		return companyService.searchCompanyByNameOnly(keywords, fetchAll, fetchLimit);
	}
	

}
