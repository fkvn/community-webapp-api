package mono.thainow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.databind.ObjectMapper;

import mono.thainow.dao.CompanyDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.user.BusinessUser;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.CompanyRepository;
import mono.thainow.rest.request.CompanyRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.UserService;
import mono.thainow.util.JsonUtil;

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
		 * Status = PENDING or REJECTED or UNREGISTERED -> business account related
		 * would be update to DEACTIVATED status
		 */
		case PENDING:
		case REJECTED:
		case UNREGISTERED:
			administrator.setStatus(UserStatus.DEACTIVATED);
			break;

		/*
		 * Status = APPROVED -> business account related would be update to ACTIVE
		 * status
		 */
		case APPROVED:
			administrator.setStatus(UserStatus.ACTIVE);
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
	public Company createCompany(CompanyRequest companyRequest) {

		ObjectMapper objectMapper = new ObjectMapper();
		Company company = objectMapper.convertValue(companyRequest, Company.class);

		company = compDao.saveCompany(company);

		return company;
	}

	@Override
	public Company createCompanyWithAdministratorId(CompanyRequest companyRequest, Long adminId) {
		// TODO Auto-generated method stub
		return null;
	}

}
