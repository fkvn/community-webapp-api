package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.user.BusinessUser;
import mono.thainow.rest.request.CompanyRequest;

public interface CompanyService {

	List<Company> getAllCompanies();
	
	Company getCompanyById(Long id);
	
	Company validateIfCompnayExist(Company company);
	
	Company updateCompanyStatus(Company company, CompanyStatus newStatus);
	
	Company createCompany(CompanyRequest companyRequest, boolean isWithUser, BusinessUser user);
	
	Company createCompanyWithAdministrator(Company company, BusinessUser user,  String administratorRole);
	
}
