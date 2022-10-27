package mono.thainow.service.impl;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.CompanyDao;
import mono.thainow.dao.SearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.storage.StorageDefault;
import mono.thainow.rest.request.CompanyRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.LocationService;
import mono.thainow.service.StorageService;
import mono.thainow.util.PhoneUtil;
import mono.thainow.util.Util;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDao companyDao;

	@Autowired
	private LocationService locationService;

	@Autowired
	private StorageService storageService;

	@Autowired
	private SearchDao elasticSearchDao;

	@Override
	public Company findCompanyById(Long companyId) {
		return companyDao.findCompanyById(companyId);
	}

	@Override
	public Company createCompany(CompanyRequest companyRequest) {

		Company company = fetchCompanyFromRequest(companyRequest);

		company = saveCompany(company);

		return company;
	}

	@Override
	public List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit) {
		return elasticSearchDao.searchCompanyByNameOnly(keywords, fetchAll, fetchLimit);
	}

	@Override
	public Company fetchCompanyFromRequest(CompanyRequest companyRequest) {
		Company company = new Company();

//		Informal company is a company not having physical address 
		Boolean isInformal = Optional.ofNullable(companyRequest.getIsInformal()).orElse(false);
		company.setInformalCompany(isInformal);

//		company name 
		String name = Optional.ofNullable(companyRequest.getName()).orElse("").trim();
		Assert.isTrue(!name.isBlank(), "Invalid Name");
		company.setName(name);

//		company industry 
		String industry = Optional.ofNullable(companyRequest.getIndustry()).orElse("").trim();
		Assert.isTrue(!industry.isBlank(), "Invalid Industry");
		company.setIndustry(industry);

//		Company Logo / Profile
		StorageDefault storageDefault = new StorageDefault();
		Long profileId = storageDefault.getIndustryLogoUrl().get(company.getIndustry().toUpperCase().trim());
		if (profileId == null) {
			profileId = storageDefault.getBusinessProfileDefault();
		}
		Storage profile = storageService.findStorageById(profileId);
		company.setLogo(profile);

//		company email (optional)
		String email = Optional.ofNullable(companyRequest.getEmail()).orElse("").trim();
		if (!email.isBlank()) {
			Assert.isTrue(Util.isValidEmail(email), "Invalid Email");
			company.setEmail(email);
		}

//		company phone 
		String phone = Optional.ofNullable(companyRequest.getPhone()).orElse("").trim();
//		required for informal company
		if (isInformal) {
			Assert.isTrue(!phone.isBlank(), "Invalid Phone!");
			PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");
			company.setPhone(phone);
		}
//		phone is optional for formal company
		else if (!phone.isBlank()) {
			PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");
			company.setPhone(phone);
		}

//		company website (optinal)
		String website = Optional.ofNullable(companyRequest.getWebsite()).orElse("").trim();
		if (!website.isBlank()) {
			Assert.isTrue(Util.isValidUrl(website), "Invalid Website Address");
			company.setWebsite(website);
		}

//		company location 
		String placeid = Optional.ofNullable(companyRequest.getPlaceid()).orElse("").trim();
		String address = Optional.ofNullable(companyRequest.getAddress()).orElse("").trim();

//		company location is not required for informal company
		if (isInformal) {
//			since it's optional, only add if address is provided
			if (!address.isBlank())
				company.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
		} else {
			Assert.isTrue(address != null && !address.isBlank(), "Invalid Location!");
			company.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
		}

//		company status
		company.setStatus(CompanyStatus.PENDING);

		return company;
	}

	@Override
	public Company saveCompany(Company company) {
		return companyDao.saveCompany(company);
	}

//	@Override
//	public Storage uploadLogoPicture(Company company, MultipartFile file) {
//		StorageResponse storageResponse = storageService.upload(file);
//
////		persist storage into database
//		Storage profile = new Storage();
//
//		profile.setName(storageResponse.getName());
//		profile.setType(storageResponse.getType());
//		profile.setUrl(storageResponse.getUrl());
//		profile.setSize(storageResponse.getSize());
//
//		profile = storageService.saveStorage(profile);
//
////		attach into company
////		company.setLogoUrl(profile);
//
////		persist into database
//		company = saveCompany(company);
//
////		return company.getLogoUrl();
//
//		return null;
//	}

	@Override
	public void remove(Company company) {
		company.setStatus(CompanyStatus.REJECTED);
		saveCompany(company);
	}

	@Override
	public Company fetchCompanyFromUpdateRequest(Company company, @Valid CompanyRequest request) {

//		Informal company is a company not having physical address 
		Boolean isInformal = Optional.ofNullable(request.getIsInformal()).orElse(null);
		if (isInformal != null)
			company.setInformalCompany(isInformal);

//		name
		String name = Optional.ofNullable(request.getName()).orElse(null);
		if (name != null) {
			Assert.isTrue(!name.isBlank(), "Invalid Name!");
			company.setName(name.trim());
		}

//		industry
		String industry = Optional.ofNullable(request.getIndustry()).orElse(null);
		if (industry != null) {
			Assert.isTrue(!company.getIndustry().isBlank(), "Invalid Industry!");
			company.setIndustry(industry.trim());
		}

//		company location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
		String address = Optional.ofNullable(request.getAddress()).orElse(null);

//		company location is not required for informal company
		if (company.isInformalCompany()) {

//			since it's optional, only add if address is provided
			if (address != null)
				if (!address.isBlank())
					company.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
				else
					company.setLocation(null);
		} else {
			Assert.isTrue(address != null && !address.isBlank(), "Invalid Location!");
			company.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
		}

//		new cover pictures
		List<StorageRequest> coverPictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
		List<Storage> coverPictures = storageService.fetchStoragesFromRequests(coverPictureRequests);
		if (coverPictures != null) {
			company.setPictures(coverPictures);
		}

//		email
		String email = Optional.ofNullable(request.getEmail()).orElse(null);
		if (email != null) {
			email = email.trim();
			if (!email.isBlank()) {
				Assert.isTrue(Util.isValidEmail(email), "Invalid Email");
			}
			company.setEmail(email);
		}

//		public email
		Boolean isEmailPublic = Optional.ofNullable(request.getIsEmailPublic()).orElse(null);
		if (isEmailPublic != null) {
			company.setEmailPublic(isEmailPublic);
		}

//		company phone 
		String phone = Optional.ofNullable(request.getPhone()).orElse(null);
//		required for informal company
		if (company.isInformalCompany()) {
			Assert.isTrue(!phone.isBlank(), "Phone number is required when a business doesn't have physical location!");
			PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");
			company.setPhone(phone);
		}
//		phone is optional for formal company
		else if (phone != null) {
			phone = phone.trim();
			if (!phone.isBlank()) {
				PhoneUtil.validatePhoneNumberWithGoogleAPI(phone.trim(), "US");
			}
			company.setPhone(phone);
		}

//		public phone
		Boolean isPhonePublic = Optional.ofNullable(request.getIsPhonePublic()).orElse(null);
		if (isPhonePublic != null) {
			company.setPhonePublic(isPhonePublic);
		}

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			company.setDescription(description.trim());
		}

//		public description
		Boolean isDescriptionPublic = Optional.ofNullable(request.getIsDescriptionPublic()).orElse(null);
		if (isDescriptionPublic != null) {
			company.setDescriptionPublic(isDescriptionPublic);
		}

//		website
		String website = Optional.ofNullable(request.getWebsite()).orElse(null);
		if (website != null) {
			website =  website.trim();
			if (!website.isBlank()) {
				Assert.isTrue(Util.isValidUrl(website), "Invalid Website Address");
			}
			company.setWebsite(website);
		}

//		public website
		Boolean isWebsitePublic = Optional.ofNullable(request.getIsWebsitePublic()).orElse(null);
		if (isWebsitePublic != null) {
			company.setWebsitePublic(isWebsitePublic);
		}

//		size
		String size = Optional.ofNullable(request.getSize()).orElse(null);
		if (size != null) {
			company.setSize(size.trim());
		}

//		public size
		Boolean isSizePublic = Optional.ofNullable(request.getIsSizePublic()).orElse(null);
		if (isSizePublic != null) {
			company.setSizePublic(isSizePublic);
		}

		return company;
	}

	@Override
	public Company activateCompany(Company company) {
		company.setStatus(CompanyStatus.REGISTERED);
		return saveCompany(company);
	}

}
