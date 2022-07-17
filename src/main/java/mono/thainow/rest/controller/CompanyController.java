package mono.thainow.rest.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.storage.StorageDefault;
import mono.thainow.rest.request.CompanyRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.UserService;

@RestController
//@PreAuthorize("hasAnyAuthority('COMPANY_MANAGE')")
@RequestMapping("/api/companies")
public class CompanyController {

	@Autowired
	private CompanyService companyService;

	@Autowired
	private UserService userService;

	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<Company> getAllCompanies() {
		return companyService.getAllCompanies();
	}
	
	@GetMapping("/industryLogoUrl")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public StorageDefault getIndustryLogoUrl() {
		return new StorageDefault();
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Company createCompany(@RequestBody CompanyRequest compRequest) {		
		return companyService.createCompany(compRequest);
	}

	@PostMapping("/withAdministrator/{administratorId}")
	@ResponseStatus(HttpStatus.CREATED)
	public Company createCompanyWithAdministrator(@RequestBody CompanyRequest compRequest,
			@PathVariable Long administratorId) {

//		BusinessUser user = (BusinessUser) userService.getByUserId(administratorId);
//
//		ObjectMapper objectMapper = new ObjectMapper();
//		Company company = objectMapper.convertValue(compRequest, Company.class);

//		return companyService.createCompanyWithAdministrator(company, user, compRequest.getAdministratorRole());
		
		return null;

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
	
	@PostMapping("/validatePhone")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void validatePhone(@RequestBody Map<String, Object> companyInfo) {
		String phone = Optional.ofNullable((String) companyInfo.get("phone")).orElse("").trim();
		companyService.validateCompanyPhone(phone);
	}
	
	@PostMapping("/validateEmail")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void validateEmail(@RequestBody Map<String, Object> companyInfo) {
		String email = Optional.ofNullable((String) companyInfo.get("email")).orElse("").trim();
		companyService.validateCompanyEmail(email);
	}
}
