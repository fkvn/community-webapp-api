package mono.thainow.dao;

import mono.thainow.domain.company.Company;

public interface CompanyDao {

	Company findCompanyById(Long id);
	
	Company findCompanyByName(String name);
	
	Company saveCompany(Company company);
	
	void removeCompany(Long id);
	
}
