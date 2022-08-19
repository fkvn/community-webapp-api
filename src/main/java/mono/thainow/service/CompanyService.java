package mono.thainow.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.CompanySignupRequest;
import mono.thainow.rest.request.CompanyUpdateInfoRequest;

public interface CompanyService {

	List<Company> getAllCompanies();
	
	Company getCompanyById(Long id);
	
	Company updateCompanyStatus(Company company, CompanyStatus newStatus);
	
	Company getCompanyFromRequest(CompanySignupRequest companyRequest);
	
	Company createCompany(CompanySignupRequest companyRequest);
	
	Storage uploadLogoPicture(Company company, @RequestParam("file") MultipartFile file);
	
//	Company createCompanyWithAdministrator(Company company, BusinessUser user,  String administratorRole);
//	
//	Company validateCompanyWithUserById(Long companyId, BusinessUser user);
	
	List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit);
	
	Company saveCompany(Company company);

	void remove(Company company);

	Company getCompanyFromUpdateInfoRequest(Company company, @Valid CompanyUpdateInfoRequest companyUpdateInfoRequest);
}
