package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

public interface ProfileService {
	
	List<Profile> getProfiles(User account);
	
	List<Profile> getAllProfiles(User account);
	
	Profile getProfile(Long id);
	
	CompanyProfile getCompanyProfile(Long companyId);
	
	UserProfile getUserProfile(Long id);
	
	UserProfile getUserProfile(User user);
	
	Profile createProfile(User user);
	
	Profile createProfile(User user, Company company);
	
	Profile saveProfile(Profile profile);

	Profile remove(Profile profile);
		
}
