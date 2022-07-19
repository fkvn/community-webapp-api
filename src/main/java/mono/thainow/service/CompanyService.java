package mono.thainow.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.CompanyRequest;

public interface CompanyService {

	List<Company> getAllCompanies();
	
	Company getCompanyById(Long id);
	
	Company validateIfCompnayExist(Company company);
	
	Company updateCompanyStatus(Company company, CompanyStatus newStatus);
	
	Company getCompanyFromRequest(CompanyRequest companyRequest);
	
	Company createCompany(CompanyRequest companyRequest);
	
	Storage uploadLogoPicture(Company company, @RequestParam("file") MultipartFile file);
	
//	Company createCompanyWithAdministrator(Company company, BusinessUser user,  String administratorRole);
//	
//	Company validateCompanyWithUserById(Long companyId, BusinessUser user);
	
	List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit);
	
	String validateCompanyPhone(String phone);
	
	String validateCompanyEmail(String email);
	
	Company saveCompany(Company company);
}
