package mono.thainow.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import com.fasterxml.jackson.databind.ObjectMapper;

import mono.thainow.dao.CompanyDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.user.BusinessUser;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.CompanyRepository;
import mono.thainow.rest.request.CompanyRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.UserService;

@Repository
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyRepository compRepo;

	@Autowired
	private CompanyDao compDao;

	@Autowired
	private UserService userService;

	@Override
	public List<Company> getAllCompanies() {
		return compRepo.findAll();
	}

	@Override
	public Company getCompanyById(Long id) {
		return compRepo.getById(id);
	}

	@Override
	public Company updateCompanyStatus(Company company, CompanyStatus newStatus) {

		BusinessUser administrator = (BusinessUser) userService.getByUserId(company.getAdministrator().getId());

//		update administrator status
		switch (newStatus) {
		/*
		 * Status = PENDING or REJECTED -> business account related would be update to
		 * DEACTIVATED status
		 */
		case PENDING:
		case REJECTED:
			administrator.setStatus(UserStatus.DEACTIVATED);
			break;
		/*
		 * Status = UNREGISTERED -> there is no administrator or business belongs to
		 * this company
		 * 
		 */
		case UNREGISTERED: {

			company.setAdministrator(null);
			company.setAdministratorRole(null);

			administrator.getCompanies().remove(company);
		}
			break;
		/*
		 * Status = APPROVED -> business account related would be update to ACTIVE
		 * status
		 */
		case APPROVED: {
			Assert.isTrue(
					administrator.getCompanies().stream().filter(comp -> comp.getStatus() == CompanyStatus.APPROVED)
							.collect(Collectors.toList()).size() < 1,
					"Only 1 active company per business at the moment!");

			administrator.setStatus(UserStatus.ACTIVATED);
		}
			break;
		default:
			break;
		}

//		update company status
		company.setStatus(newStatus);

//		merge company into database
		company = compDao.saveCompany(company);

		return company;
	}

	@Override
	public Company createCompany(CompanyRequest companyRequest, boolean isWithUser, BusinessUser user) {

		ObjectMapper objectMapper = new ObjectMapper();
		Company company = objectMapper.convertValue(companyRequest, Company.class);

//		with administrator 
		if (isWithUser) {
			company = createCompanyWithAdministrator(company, user, companyRequest.getAdministratorRole());
		} else {
//			no administrator
			company = compDao.saveCompany(company);
		}

		return company;
	}

	@Override
	public Company createCompanyWithAdministrator(Company company, BusinessUser user, String administratorRole) {
			
//		the administrator has to be BUSINESS Role
		Assert.isTrue(user.getRole() == UserRole.BUSINESS && user != null, "Invalid Company Administrator!");

//		Company Location at the moment is the same with the user - 4/16/22
		company.setLocation(user.getLocation());
		
//		validate company
		company = validateIfCompnayExist(company);
		
//		Assert that company doesn't have any business account attached
		Assert.isTrue(company.getAdministrator() == null, "Company has been registered by another administrator!");

//		Company email at the moment is the same with the user - 4/16/22
		company.setEmail(user.getEmail());
		company.setEmailVerified(user.isEmailVerified());

//		Company phone at the moment is the same with the user - 4/16/22
		company.setPhone(user.getPhone());
		company.setPhoneVerified(user.isPhoneVerified());

//		update administrator
		company.setAdministrator(user);
		
//		update administrator
		company.setAdministratorRole(administratorRole);

//		company status as Pending WHEN start 
		company.setStatus(CompanyStatus.PENDING);

//		Merge into database with updated information 
		company = compDao.saveCompany(company);

		return company;
	}

	@Override
	public Company validateIfCompnayExist(Company company) {
		
		Company dbCompany = compDao.getCompany(company.getName(), company.getLocation());
		
//		new company
		if (dbCompany == null) {
			
//			persit company into database
			company.setStatus(CompanyStatus.UNREGISTERED);
			company.setAdministratorRole("");
			company = compDao.saveCompany(company);
		}
		else {
			company = dbCompany;
		}
		
		return company;
	}

}
