package mono.thainow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.BusinessProfile;
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

//	@Override
//	public List<Profile> findAllProfilesByAccount(User account) {
//		return profileDao.findAllProfilesByAccount(account);
//	}
//
//	@Override
//	public List<Profile> findProfilesByAccount(User account) {
//		return profileDao.findProfilesByAccount(account);
//	}

	@Override
	public List<BusinessProfile> findBusinessProfilesByAccount(User account) {
		return profileDao.findBusinessProfilesByAccount(account);
	}

//	@Override
//	public UserProfile getValidUserProfile(Long id) {
//		return profileDao.findActiveUserProfileById(id);
//	}

	@Override
	public UserProfile findUserProfileByAccount(User user) {
		return profileDao.findActiveUserProfileByAccount(user);
	}

	@Override
	public void removeProfile(UserProfile profile, boolean removeAccount) {

//		remove account
		userService.remove(profile.getAccount());

//		remove related post
		List<Post> posts = postService.findPostsByProfile(profile);
		postService.removePosts(posts);

		if (removeAccount) {
			// remove / delete company profiles
			List<BusinessProfile> profiles = findBusinessProfilesByAccount(profile.getAccount());

			profiles.forEach(prof -> {
				// disable profile
				removeBusinessProfile(prof);
			});
		}

//		delete user profile
		profileDao.deleteProfileById(profile.getId());
	}

//	@Override
//	public BusinessProfile findRegisteredBusinessProfileById(Long profileId) {
//		return profileDao.findRegisteredBusinessProfileById(profileId);
//	}

	@Override
	public Profile findProfileById(Long profileId) {
		return profileDao.findProfileById(profileId);
	}

	@Override
	public Profile saveProfile(Profile profile) {
		return profileDao.saveProfile(profile);
	}

	@Override
	public UserProfile createUserProfile(User user) {

		try {
			profileDao.findActiveUserProfileByAccount(user);

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
	public BusinessProfile createBusinessProfile(User owner, Company company) {

//		profile limitation
		List<BusinessProfile> profiles = findBusinessProfilesByAccount(owner);
		Assert.isTrue(profiles.size() < 5, "Exceed Profile Limitation (Max 5 business profiles for each account)!");

//		create a business profile with new company
		BusinessProfile profile = new BusinessProfile(owner, company);

		return (BusinessProfile) saveProfile(profile);
	}

	@Override
	public void removeBusinessProfile(BusinessProfile businessProfile) {

//		remove company
		companyService.remove(businessProfile.getCompany());

//		remove related post
		List<Post> posts = postService.findPostsByProfile(businessProfile);
		postService.removePosts(posts);

//		delete profile (hard delete)
		profileDao.deleteProfileById(businessProfile.getId());
	}

	@Override
	public BusinessProfile disableBusinessProfile(BusinessProfile profile) {

//		block company
		profile.getCompany().setStatus(CompanyStatus.DISABLED);
		companyService.saveCompany(profile.getCompany());

		return profile;
	}

	@Override
	public UserProfile disableUserProfile(UserProfile profile) {

//		block user
		profile.getAccount().setStatus(UserStatus.DISABLED);
		userService.saveUser(profile.getAccount());

		return profile;

	}

	@Override
	public BusinessProfile activateBusinessProfile(BusinessProfile profile) {

//		activate company
		profile.getCompany().setStatus(CompanyStatus.REGISTERED);
		companyService.saveCompany(profile.getCompany());

		return profile;
	}

	@Override
	public UserProfile activateUserProfile(UserProfile profile) {

//		activate user
		profile.getAccount().setStatus(UserStatus.ACTIVATED);
		userService.saveUser(profile.getAccount());

		return profile;
	}

//	@Override
//	public BusinessProfile getValidCompanyProfile(Company com) {
//		return profileDao.getValidCompanyProfile(com);
//	}
//
//	@Override
//	public BusinessProfile findBusinessProfileById(Long profileId) {
//		return profileDao.findBusinessProfileById(profileId);
//	}

	@Override
	public List<Profile> findProfilesByAccountId(Long id) {
		return profileDao.findProfilesByAccountId(id);
	}

	@Override
	public void blockPost(Long requesterId, Long postId) {

		Profile requester = findProfileById(requesterId);
		Post post = postService.findPostById(postId);

		Assert.isTrue(!post.getOwner().getId().equals(requesterId), "Profiles can't block their own post");

		if (requester.getBlockedPosts().indexOf(post) < 0) {
			requester.getBlockedPosts().add(post);
			requester = saveProfile(requester);			
		}
		
		if (post.getBlockers().indexOf(requester) < 0) {
			post.getBlockers().add(requester);
			post = postService.savePost(post);
		}
		
	}

	@Override
	public void unBlockPost(Long requesterId, Long postId) {

		Profile requester = findProfileById(requesterId);
		Post post = postService.findPostById(postId);

		requester.getBlockedPosts().remove(post);
		requester = saveProfile(requester);

		post.getBlockers().remove(requester);
		post = postService.savePost(post);
	}
}
