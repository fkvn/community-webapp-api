package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

public interface ProfileService {
	
	List<Profile> getProfiles(User account);
	
	Profile getProfile(Long id);
	
	CompanyProfile getCompanyProfile(User account, Long companyId);
	
	UserProfile getUserProfile(User account);
	
	Profile createProfile(User user);
	
	Profile createProfile(User user, Company company);
	
	Profile saveProfile(Profile profile);
		
}
