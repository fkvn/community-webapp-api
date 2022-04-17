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

import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.rest.request.CompanyRequest;
import mono.thainow.service.CompanyService;

@RestController
//@PreAuthorize("hasAnyAuthority('COMPANY_MANAGE')")
@RequestMapping("/api/companies")
public class CompanyController {

	@Autowired
	private CompanyService compService;
	
	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<Company> getAllCompanies() {
		return compService.getAllCompanies();
	} 
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Company createCompany(@RequestBody CompanyRequest compRequest) {
		return compService.createCompany(compRequest);
	} 
	
	@PutMapping("{id}/status")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Company updateCompanyStatus(@PathVariable Long id, @RequestParam String newStatus) {
		Company company = compService.getCompanyById(id);
		return compService.updateCompanyStatus(company, CompanyStatus.valueOf(newStatus));
	}
}
