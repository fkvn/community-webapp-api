package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.rest.request.CompanyRequest;

public interface CompanyService {

	List<Company> getAllCompanies();
	Company getCompanyById(Long id);
	
	Company updateCompanyStatus(Company company, CompanyStatus newStatus);
	
	Company createCompany(CompanyRequest companyRequest);
	
	Company createCompanyWithAdministratorId(CompanyRequest companyRequest, Long adminId);
	
}
