package mono.thainow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.service.CompanyService;
import mono.thainow.service.PostService;
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

	@Autowired
	private PostService postService;

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
	public void removeProfile(UserProfile profile, boolean removeAccount) {

//		remove account
		userService.remove(profile.getAccount());
		
//		remove related post
		List<Post> posts = postService.getPosts(profile);
		postService.removePosts(posts);
		
		if (removeAccount) {
	//		remove / delete company profiles
			List<CompanyProfile> profiles = getValidCompanyProfiles(profile.getAccount());
	
			profiles.forEach(prof -> {
	//			disable profile
				removeProfile(prof);
			});
		}

//		delete user profile
		profileDao.deleteProfile(profile.getId());
	}

	@Override
	public CompanyProfile getValidCompanyProfile(Long profileId) {
		return profileDao.getValidCompanyProfile(profileId);
	}

	@Override
	public Profile getProfile(Long profileId) {
		return profileDao.getProfile(profileId);
	}

	@Override
	public Profile saveProfile(Profile profile) {
		return profileDao.saveProfile(profile);
	}

	@Override
	public UserProfile createProfile(User user) {

		try {
			profileDao.getValidUserProfile(user);

//			if no error -> already existed -> one account only can have 1 user profile
			Assert.isTrue(false, "One account only can have 1 USER_PROFILE!");

			return null;
		} catch (Exception e) {

//			error -> new account
//			create a account profile with new user
			UserProfile profile = new UserProfile(user);

			return (UserProfile) saveProfile(profile);
		}
	}

	@Override
	public CompanyProfile createProfile(User owner, Company company) {

//		profile limitation
		List<CompanyProfile> profiles = getValidCompanyProfiles(owner);
		Assert.isTrue(profiles.size() < 5, "Exceed Profile Limitation (Max 5 business profiles for each account)!");

//		create a business profile with new company
		CompanyProfile profile = new CompanyProfile(owner, company);

		return (CompanyProfile) saveProfile(profile);
	}

	@Override
	public void removeProfile(CompanyProfile companyProfile) {

//		remove company
		companyService.remove(companyProfile.getCompany());

//		remove related post
		List<Post> posts = postService.getPosts(companyProfile);
		postService.removePosts(posts);

//		delete profile (hard delete)
		profileDao.deleteProfile(companyProfile.getId());
	}

	@Override
	public CompanyProfile disableProfile(CompanyProfile profile) {

//		block company
		profile.getCompany().setStatus(CompanyStatus.DISABLED);
		companyService.saveCompany(profile.getCompany());

		return profile;
	}

	@Override
	public UserProfile disableProfile(UserProfile profile) {

//		block user
		profile.getAccount().setStatus(UserStatus.DISABLED);
		userService.saveUser(profile.getAccount());

		return profile;

	}

	@Override
	public CompanyProfile activateProfile(CompanyProfile profile) {

//		activate company
		profile.getCompany().setStatus(CompanyStatus.REGISTERED);
		companyService.saveCompany(profile.getCompany());

		return profile;
	}

	@Override
	public UserProfile activateProfile(UserProfile profile) {

//		activate user
		profile.getAccount().setStatus(UserStatus.ACTIVATED);
		userService.saveUser(profile.getAccount());

		return profile;
	}

}
