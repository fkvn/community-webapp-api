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
import mono.thainow.service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao profileDao;

//	==================================================

	@Override
	public List<Profile> getProfiles(User account) {
		return profileDao.getProfiles(account);
	}

	@Override
	public UserProfile getUserProfile(User user) {
		return profileDao.getUserProfile(user);
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

}
