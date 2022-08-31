package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

public interface ProfileDao {
	
	List<Profile> getProfiles(User account);
	
	List<Profile> getAllProfiles(User account);
	
	UserProfile getValidUserProfile(Long id);
	
	CompanyProfile getValidCompanyProfile(Long profileId);

	Profile saveProfile(Profile profile);

	UserProfile getValidUserProfile(User user);

	List<CompanyProfile> getValidCompanyProfiles(User account);
	
	void deleteProfile(Long profileId);

	Profile getProfile(Long profileId);

	CompanyProfile getValidCompanyProfile(Company com);

}
