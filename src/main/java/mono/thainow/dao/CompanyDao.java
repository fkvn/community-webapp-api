package mono.thainow.dao;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;

public interface CompanyDao {

	Company getCompanyById(Long id);
	
	Company getCompanyByName(String name);
	
	Company getCompany(String name, Location location);
	
	Company saveCompany(Company company);
	
	boolean isEmailUnique(String email);
	
	boolean isPhoneUnique(String phone);
	
	void removeCompany(Long id);
	
}
