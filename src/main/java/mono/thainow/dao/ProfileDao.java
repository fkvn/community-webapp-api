package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

public interface ProfileDao {
	
	UserProfile getUserProfile(User user);

	Profile saveProfile(Profile profile);

	List<Profile> getProfiles(User account);
	
}
