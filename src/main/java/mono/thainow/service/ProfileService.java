package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

public interface ProfileService {

	List<Profile> getAllProfiles(User account);

	List<Profile> getProfiles(User account);

	List<CompanyProfile> getValidCompanyProfiles(User account);

	UserProfile createProfile(User user);

	CompanyProfile createProfile(User user, Company company);

	void removeProfile(CompanyProfile companyProfile);

	void removeProfile(UserProfile profile);

	UserProfile getValidUserProfile(Long profileId);

	UserProfile getValidUserProfile(User user);

	CompanyProfile getValidCompanyProfile(Long profileId);

	CompanyProfile activateProfile(CompanyProfile profile);
	
	CompanyProfile blockProfile(CompanyProfile profile);

	UserProfile blockProfile(UserProfile profile);

	Profile getProfile(Long profileId);

	Profile saveProfile(Profile profile);

	UserProfile activateProfile(UserProfile profile);

}
