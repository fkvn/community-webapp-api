package mono.thainow.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.CompanyDao;
import mono.thainow.dao.ElasticSearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.user.BusinessUser;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.CompanyRepository;
import mono.thainow.rest.request.CompanyRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.LocationService;
import mono.thainow.service.UserService;
import mono.thainow.util.PhoneUtil;

@Service
public class CompanyServiceImpl implements CompanyService {

//	@Autowired
//	private CompanyRepositoryElastic compRepo;

	@Autowired
	private CompanyDao companyDao;
	
	@Autowired
	private CompanyRepository companyRepo;

	@Autowired
	private UserService userService;

	@Autowired
	private LocationService locationService;

	@Autowired
	private ElasticSearchDao elasticSearchDao;

	@Override
	public List<Company> getAllCompanies() {
		return companyRepo.findAll();
//		return new ArrayList<>();
	}

	@Override
	public Company getCompanyById(Long id) {
//		return compRepo.getById(id);
		return companyDao.getCompanyById(id);
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
		case REGISTERED: {
			Assert.isTrue(
					administrator.getCompanies().stream().filter(comp -> comp.getStatus() == CompanyStatus.REGISTERED)
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
		company = companyDao.saveCompany(company);

		return company;
	}

	@Override
	public Company createCompany(CompanyRequest companyRequest, boolean isWithUser, BusinessUser user) {

//		ObjectMapper objectMapper = new ObjectMapper();
//		Company company = objectMapper.convertValue(companyRequest, Company.class);
		Company company = new Company();

////		with administrator 
//		if (isWithUser) {
//			company = createCompanyWithAdministrator(company, user, companyRequest.getAdministratorRole());
//		} else {
////			no administrator
//
//			String placeid = Optional.ofNullable(companyRequest.getPlaceid()).orElse("");
//			String address = Optional.ofNullable(companyRequest.getAddress()).orElse("");
//			company.setAddress(locationService.getLocationFromPlaceidAndAddress(placeid, address));
//
//			company.setName(companyRequest.getName());
//			company.setIndustry(companyRequest.getIndustry());
//
//			company = companyDao.saveCompany(company);
//		}

		return company;
	}

	@Override
	public Company createCompanyWithAdministrator(Company company, BusinessUser user, String administratorRole) {
//
////		the administrator has to be BUSINESS Role
//		Assert.isTrue(user.getRole() == UserRole.BUSINESS && user != null, "Invalid Company Administrator!");
//
////		Company Location at the moment is the same with the user - 4/16/22
//		company.setAddress(user.getLocation());
//
////		validate company
//		company = validateIfCompnayExist(company);
//
////		Assert that company doesn't have any business account attached
//		Assert.isTrue(company.getAdministrator() == null, "Company has been registered by another administrator!");
//
////		Company email at the moment is the same with the user - 4/16/22
//		company.setEmail(user.getEmail());
//		company.setEmailVerified(user.isEmailVerified());
//
////		Company phone at the moment is the same with the user - 4/16/22
//		company.setPhone(user.getPhone());
//		company.setPhoneVerified(user.isPhoneVerified());
//
////		update administrator
//		company.setAdministrator(user);
//
////		update administrator
//		company.setAdministratorRole(administratorRole);
//
////		company status as Pending WHEN start 
//		company.setStatus(CompanyStatus.PENDING);
//
////		Merge into database with updated information 
//		company = companyDao.saveCompany(company);

		return company;
	}

	@Override
	public Company validateIfCompnayExist(Company company) {
		
		return null;

//		Company dbCompany = companyDao.getCompany(company.getName(), company.getAddress());
//
////		new company
//		if (dbCompany == null) {
//
////			persit company into database
//			company.setStatus(CompanyStatus.UNREGISTERED);
//			company.setAdministratorRole("");
//			company = companyDao.saveCompany(company);
//		} else {
//			company = dbCompany;
//		}
//
//		return company;
	}

	@Override
	public Company validateCompanyWithUserById(Long companyId, BusinessUser user) {

//		assert that company is not missing
		Assert.isTrue(companyId != null, "Invalid Company ID!");

//		get company
		Company company = getCompanyById(companyId);

//		assert that the company belongs to the author
		Assert.isTrue(user.getCompanies().contains(company), "Invalid Company!");

		return company;
	}

	@Override
	public List<Company> searchCompany(String keywords, boolean fetchAll, int fetchLimit) {
		return elasticSearchDao.searchCompany(keywords, fetchAll, fetchLimit);
	}

	@Override
	public String validateCompanyPhone(String phone) {
//		validate phone unique
		boolean isPhoneUnique = companyDao.isPhoneUnique(phone);

		Assert.isTrue(isPhoneUnique, "Phone already existed!");

//		validate phone number
		PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");

		return phone;
	}

	@Override
	public String validateCompanyEmail(String email) {
//		validate email unique
		boolean isEmailUnique = companyDao.isEmailUnique(email);

		Assert.isTrue(isEmailUnique, "Email already existed!");

		return email;
	}

	@Override
	public Company getCompanyFromRequest(CompanyRequest companyRequest) {
		Company company = new Company();

//		is Informal company
		boolean isInformal = Optional.ofNullable(companyRequest.isInformal()).orElse(false);
		company.setInformal(isInformal);

//		company name 
		String name = Optional.ofNullable(companyRequest.getName()).orElse("").trim();
		Assert.isTrue(!name.isEmpty(), "Invalid Company Name");
		company.setName(name);

//		company industry 
		String industry = Optional.ofNullable(companyRequest.getIndustry()).orElse("").trim();
		Assert.isTrue(!industry.isEmpty(), "Invalid Company Industry");
		company.setIndustry(industry);

//		company email 
		String email = Optional.ofNullable(companyRequest.getEmail()).orElse("").trim();
		Assert.isTrue(email.length() <= 50, "Email can't be more than 50 characters");
		company.setEmail(email);

//		email Verified
		boolean isEmailVerified = Optional.ofNullable(companyRequest.isEmailVerified()).orElse(false);
		company.setEmailVerified(isEmailVerified);

//		company phone 
		String phone = Optional.ofNullable(companyRequest.getPhone()).orElse("").trim();
//		phone is optional as default
		Assert.isTrue(phone.length() == 14 || phone.length() == 0,
				"Invalid Phone Number! Phone number must be in format (xxx) xxx-xxxx");
//		required for informal company
		if (isInformal) {
			Assert.isTrue(!phone.isEmpty(), "Company phone is required for an informal company");
		}
		company.setPhone(phone);

//		phone Verified
		boolean isPhoneVerified = Optional.ofNullable(companyRequest.isPhoneVerified()).orElse(false);
		company.setPhoneVerified(isPhoneVerified);

//		company description 
		String description = Optional.ofNullable(companyRequest.getDescription()).orElse("").trim();
		company.setDescription(description);

//		company website - only add if the website is not empty
		String website = Optional.ofNullable(companyRequest.getWebsite()).orElse("").trim();
		if (!website.isEmpty()) {
			company.setWebsite(website);
		}
		
		
//		company founded 
		String founded = Optional.ofNullable(companyRequest.getFounded()).orElse("").trim();
		company.setFounded(founded);
		
		
//		company revenue 
		String revenue = Optional.ofNullable(companyRequest.getRevenue()).orElse("").trim();
		company.setRevenue(revenue);
		
//		company size 
		String size = Optional.ofNullable(companyRequest.getSize()).orElse("").trim();
		company.setSize(size);
		
//		company location OR company service location (informal company) 
		String placeid = Optional.ofNullable(companyRequest.getPlaceid()).orElse("").trim();
		String address = Optional.ofNullable(companyRequest.getAddress()).orElse("").trim();
		Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Invalid Location");
		company.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));
		
		
//		company status
		company.setStatus(CompanyStatus.PENDING);

		return company;
	}

	@Override
	public Company saveCompany(Company company) {
		return companyDao.saveCompany(company);
	}

}
