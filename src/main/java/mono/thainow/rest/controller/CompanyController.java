package mono.thainow.rest.controller;

import java.util.List;

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

import com.fasterxml.jackson.databind.ObjectMapper;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.user.BusinessUser;
import mono.thainow.rest.request.CompanyRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.UserService;

@RestController
//@PreAuthorize("hasAnyAuthority('COMPANY_MANAGE')")
@RequestMapping("/api/companies")
public class CompanyController {

	@Autowired
	private CompanyService compService;

	@Autowired
	private UserService userService;

	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<Company> getAllCompanies() {
		return compService.getAllCompanies();
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Company createCompany(@RequestBody CompanyRequest compRequest) {
		return compService.createCompany(compRequest, false, null);
	}

	@PostMapping("/withAdministrator/{administratorId}")
	@ResponseStatus(HttpStatus.CREATED)
	public Company createCompanyWithAdministrator(@RequestBody CompanyRequest compRequest,
			@PathVariable Long administratorId) {

		BusinessUser user = (BusinessUser) userService.getByUserId(administratorId);

		ObjectMapper objectMapper = new ObjectMapper();
		Company company = objectMapper.convertValue(compRequest, Company.class);

		return compService.createCompanyWithAdministrator(company, user, compRequest.getAdministratorRole());
	}

	@PutMapping("{id}/status")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Company updateCompanyStatus(@PathVariable Long id, @RequestParam String newStatus) {
		
		Company company = compService.getCompanyById(id);

//		if newstatus, if old status, no change
		if (CompanyStatus.valueOf(newStatus) != company.getStatus()) {
			return compService.updateCompanyStatus(company, CompanyStatus.valueOf(newStatus));
		}
		
		return company;
	}
}