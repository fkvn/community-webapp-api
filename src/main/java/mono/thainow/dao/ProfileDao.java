package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.profile.BusinessProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

public interface ProfileDao {
	
//	List<Profile> findProfilesByAccount(User account);
	
//	List<Profile> findAllProfilesByAccount(User account);
	
	UserProfile findActiveUserProfileByAccountId(Long id);
	
//	BusinessProfile findRegisteredBusinessProfileById(Long profileId);

	Profile saveProfile(Profile profile);

	UserProfile findActiveUserProfileByAccount(User user);

	List<BusinessProfile> findBusinessProfilesByAccount(User account);
	
	List<BusinessProfile> findBusinessProfilesByAccountId(Long id);
	
	void deleteProfileById(Long profileId);

	Profile findProfileById(Long profileId);

//	BusinessProfile getValidCompanyProfile(Company com);

//	BusinessProfile findBusinessProfileById(Long profileId);

	List<Profile> findProfilesByAccountId(Long id);

//	UserProfile findUserProfileById(Long profileId);

}
