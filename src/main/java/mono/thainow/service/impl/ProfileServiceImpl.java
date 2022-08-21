package mono.thainow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
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
	public List<Profile> getAllProfiles(User account) {
		return profileDao.getAllProfiles(account);
	}

	@Override
	public List<Profile> getProfiles(User account) {
		return profileDao.getProfiles(account);
	}

	@Override
	public List<CompanyProfile> getValidCompanyProfiles(User account) {
		return profileDao.getValidCompanyProfiles(account);
	}

	@Override
	public UserProfile getValidUserProfile(Long id) {
		return profileDao.getValidUserProfile(id);
	}

	@Override
	public UserProfile getValidUserProfile(User user) {
		return profileDao.getValidUserProfile(user);
	}

	@Override
	public void removeProfile(UserProfile profile) {

//		disable account
		userService.remove(profile.getAccount());

//		disable profiles
		List<CompanyProfile> profiles = getValidCompanyProfiles(profile.getAccount());

		profiles.forEach(prof -> {

//			disable profile
			removeProfile(prof);
		});
	}

	@Override
	public CompanyProfile getValidCompanyProfile(Long profileId) {
		return profileDao.getValidCompanyProfile(profileId);
	}

	@Override
	public Profile saveProfile(Profile profile) {
		return profileDao.saveProfile(profile);
	}

	@Override
	public Profile createProfile(User user) {

		try {
			profileDao.getValidUserProfile(user);

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
		List<CompanyProfile> profiles = getValidCompanyProfiles(owner);
		Assert.isTrue(profiles.size() < 5, "Exceed Profile Limitation (Max 5 business profiles for each account)!");

//		create a business profile with new company
		CompanyProfile profile = new CompanyProfile(owner, company);

		return saveProfile(profile);
	}

	@Override
	public void removeProfile(CompanyProfile companyProfile) {
		companyService.remove(companyProfile.getCompany());
	}

}
