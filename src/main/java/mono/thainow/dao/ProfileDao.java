package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

public interface ProfileDao {
	
	Profile getProfiles(Long id);
	
	UserProfile getUserProfile(User user);
	
	CompanyProfile getCompanyProfile(User account, Long companyId);

	Profile saveProfile(Profile profile);

	List<Profile> getProfiles(User account);

}
