package mono.thainow.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.storage.StorageDefault;
import mono.thainow.domain.user.User;
import mono.thainow.service.ProfileService;
import mono.thainow.service.StorageService;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao profileDao;

	@Autowired
	private StorageService storageService;

	@Override
	public Profile saveProfile(Profile profile) {
		return profileDao.saveProfile(profile);
	}

	@Override
	public Profile createProfile(User user, Storage profileUrl) {

//		create a account profile with new user
		UserProfile profile = new UserProfile(user);
		
		
//		if default profile picture
		if (profileUrl == null) {
			StorageDefault storageDefault = new StorageDefault();
			profileUrl = storageService.getStorage(storageDefault.getUserProfileDefault());
		}

		profile.setPicture(profileUrl);

		return saveProfile(profile);
	}

}
