package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

public interface ProfileDao {
	
	List<Profile> getProfiles(User account);
	
	List<Profile> getAllProfiles(User account);
	
	Profile getProfiles(Long id);
	
	UserProfile getUserProfile(Long id);
	
	CompanyProfile getCompanyProfile(Long companyId);

	Profile saveProfile(Profile profile);

	UserProfile getUserProfile(User user);

}
