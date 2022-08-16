package mono.thainow.service;

import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;

public interface ProfileService {
	
	Profile createProfile(User user, Storage profileUrl);
	
	Profile saveProfile(Profile profile);
		
}
