package mono.thainow.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.multipart.MultipartFile;

import mono.thainow.dao.CompanyDao;
import mono.thainow.dao.ElasticSearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.storage.StorageDefault;
import mono.thainow.repository.CompanyRepository;
import mono.thainow.rest.request.CompanySignupRequest;
import mono.thainow.rest.response.StorageResponse;
import mono.thainow.service.CompanyService;
import mono.thainow.service.LocationService;
import mono.thainow.service.StorageService;

@Service
public class CompanyServiceImpl implements CompanyService {

//	@Autowired
//	private CompanyRepositoryElastic compRepo;

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private CompanyRepository companyRepo;

	@Autowired
	private LocationService locationService;

	@Autowired
	private StorageService storageService;

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

//		BusinessUser administrator = (BusinessUser) userService.getByUserId(company.getAdministrator().getId());
//
////		update administrator status
//		switch (newStatus) {
//		/*
//		 * Status = PENDING or REJECTED -> business account related would be update to
//		 * DEACTIVATED status
//		 */
//		case PENDING:
//		case REJECTED:
//			administrator.setStatus(UserStatus.DEACTIVATED);
//			break;
//		/*
//		 * Status = UNREGISTERED -> there is no administrator or business belongs to
//		 * this company
//		 * 
//		 */
//		case UNREGISTERED: {
//
//			company.setAdministrator(null);
//			company.setAdministratorRole(null);
//
//			administrator.getCompanies().remove(company);
//		}
//			break;
//		/*
//		 * Status = APPROVED -> business account related would be update to ACTIVE
//		 * status
//		 */
//		case REGISTERED: {
//			Assert.isTrue(
//					administrator.getCompanies().stream().filter(comp -> comp.getStatus() == CompanyStatus.REGISTERED)
//							.collect(Collectors.toList()).size() < 1,
//					"Only 1 active company per business at the moment!");
//
//			administrator.setStatus(UserStatus.ACTIVATED);
//		}
//			break;
//		default:
//			break;
//		}
//
////		update company status
//		company.setStatus(newStatus);
//
////		merge company into database
//		company = companyDao.saveCompany(company);

		return company;
	}

	@Override
	public Company createCompany(CompanySignupRequest companyRequest) {

		Company company = getCompanyFromRequest(companyRequest);

		company = saveCompany(company);

		return company;
	}

	@Override
	public Company validateIfCompnayExist(Company company) {

		return null;
//		Company dbCompany = companyDao.getCompany(company.getName(), company.getLocation());
//
//		// new company
//		if (dbCompany == null) {
//
//		//	persit company into database
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
	public List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit) {
		return elasticSearchDao.searchCompanyByNameOnly(keywords, fetchAll, fetchLimit);
	}

	@Override
	public Company getCompanyFromRequest(CompanySignupRequest companyRequest) {
		Company company = new Company();

//		Informal company is a company not having physical address 
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

//		Company Logo / Profile
		StorageDefault storageDefault = new StorageDefault();
		Long profileId = storageDefault.getIndustryLogoUrl().get(company.getIndustry().toUpperCase().trim());
		if (profileId == null) {
			profileId = storageDefault.getCompanyProfileDefault();
		}
		Storage profile = storageService.getStorage(profileId);
		company.setLogo(profile);

//		company email 
		String email = Optional.ofNullable(companyRequest.getEmail()).orElse("").trim();
		company.setEmail(email);

//		company phone 
		String phone = Optional.ofNullable(companyRequest.getPhone()).orElse("").trim();
//		required for informal company
		if (isInformal) {
			Assert.isTrue(!phone.isEmpty(), "Company phone is required!");
		}
		company.setPhone(phone);

//		company website - only add if the website is not empty
		String website = Optional.ofNullable(companyRequest.getWebsite()).orElse("").trim();
		if (!website.isEmpty()) {
			company.setWebsite(website);
		}

//		company location is not required for informal company
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

	@Override
	public Storage uploadLogoPicture(Company company, MultipartFile file) {
		StorageResponse storageResponse = storageService.upload(file);

//		persist storage into database
		Storage profile = new Storage();

		profile.setName(storageResponse.getName());
		profile.setType(storageResponse.getType());
		profile.setUrl(storageResponse.getUrl());
		profile.setSize(storageResponse.getSize());

		profile = storageService.saveStorage(profile);

//		attach into company
//		company.setLogoUrl(profile);

//		persist into database
		company = saveCompany(company);

//		return company.getLogoUrl();
		
		return null;
	}

}
