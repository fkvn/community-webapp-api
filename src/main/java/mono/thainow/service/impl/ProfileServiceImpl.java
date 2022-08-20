package mono.thainow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.ProfileStatus;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;
import mono.thainow.service.CompanyService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.UserService;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao profileDao;

	@Autowired
	private UserService userService;
	
	@Autowired
	private CompanyService companyService;
	
//	==================================================

	@Override
	public List<Profile> getProfiles(User account) {
		return profileDao.getProfiles(account);
	}
	
	@Override
	public List<Profile> getAllProfiles(User account) {
		return profileDao.getAllProfiles(account);
	}

	@Override
	public Profile getProfile(Long id) {
		return profileDao.getProfiles(id);
	}
	
	@Override
	public UserProfile getUserProfile(Long id) {
		return profileDao.getUserProfile(id);
	}
	
	@Override
	public UserProfile getUserProfile(User user) {
		return profileDao.getUserProfile(user);
	}

	@Override
	public void removeUserProfile(UserProfile profile) {
		
//		disable profiles
		List<Profile> profiles = getAllProfiles(profile.getAccount());
		
		profiles.forEach(prof -> {

//			disable company
			if (prof.getDecriminatorValue().equals("COMPANY_PROFILE")) {			
				companyService.remove(companyService.getCompanyById(((CompanyProfile) prof).getCompanyId()));
			}

//			disable profile
			remove(prof);
		});

//		disable account
		userService.remove(profile.getAccount());
		
	}
	
	@Override
	public CompanyProfile getCompanyProfile(Long companyId) {
		return profileDao.getCompanyProfile(companyId);
	}

	@Override
	public Profile saveProfile(Profile profile) {
		return profileDao.saveProfile(profile);
	}

	@Override
	public Profile createProfile(User user) {

		try {
			profileDao.getUserProfile(user);

//			if no error -> already existed -> one account only can have 1 user profile
			Assert.isTrue(false, "One account only can have 1 USER_PROFILE!");

			return null;
		} catch (Exception e) {

//			error -> new account
//			create a account profile with new user
			UserProfile profile = new UserProfile(user);

			return saveProfile(profile);
		}
	}

	@Override
	public Profile createProfile(User owner, Company company) {

//		profile limitation
		List<Profile> profiles = getProfiles(owner);
		Assert.isTrue(profiles.size() < 6, "Exceed Profile Limitation (Max 5 business profiles for each account)!");

//		create a business profile with new company
		CompanyProfile profile = new CompanyProfile(owner, company);

		return saveProfile(profile);
	}

	@Override
	public Profile remove(Profile profile) {
		profile.setStatus(ProfileStatus.DELETED);
		return saveProfile(profile);
	}



}
