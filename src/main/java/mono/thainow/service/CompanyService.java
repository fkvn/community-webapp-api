package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.rest.request.CompanyRequest;

public interface CompanyService {

	Company fetchCompanyFromRequest(Company company, CompanyRequest request);
	
	Company createCompany(CompanyRequest companyRequest);
	
//	Storage uploadLogoPicture(Company company, @RequestParam("file") MultipartFile file);
	
//	Company createCompanyWithAdministrator(Company company, BusinessUser user,  String administratorRole);
//	s
//	Company validateCompanyWithUserById(Long companyId, BusinessUser user);
	
	List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit);
	
	Company saveCompany(Company company);

	void remove(Company company);

//	Company fetchCompanyFromUpdateRequest(Company company, @Valid CompanyRequest request);

	Company findCompanyById(Long companyId);

	Company activateCompany(Company company);

}
