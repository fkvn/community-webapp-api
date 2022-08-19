package mono.thainow.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.validator.internal.constraintvalidators.bv.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.UserDao;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.storage.StorageDefault;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.rest.request.AppleSignupRequest;
import mono.thainow.rest.request.FacebookSignupRequest;
import mono.thainow.rest.request.GoogleSignupRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.rest.request.UserUpdateInfoRequest;
import mono.thainow.service.LocationService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;
import mono.thainow.util.PhoneUtil;
import mono.thainow.util.Util;

@Service
@Primary
//@Qualifier
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private StorageService storageService;

	@Autowired
	private LocationService locationService;

//	=============================================================

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public User getActiveUserByEmail(String email) {
		return userDao.getActiveUserByEmail(email);
	}

	@Override
	public User getActiveUserByPhone(String phone) {
		return userDao.getActiveUserByPhone(phone);
	}

	@Override
	public User getActiveUserBySub(String sub) {
		return userDao.getActiveUserBySub(sub);
	}

	@Override
	public User getByUserId(Long id) {
		return userDao.getUserById(id);
	}

	@Override
	public User saveUser(User user) {
		return userDao.saveUser(user);
	}

//	@Override
//	public Storage uploadProfilePicture(User user, @RequestParam("file") MultipartFile file) {
//
//		StorageResponse storageResponse = storageService.upload(file);
//
////		persist storage into database
//		Storage profile = new Storage();
//
//		profile.setName(storageResponse.getName());
//		profile.setType(storageResponse.getType());
//		profile.setUrl(storageResponse.getUrl());
//		profile.setSize(storageResponse.getSize());
//
//		profile = storageService.saveStorage(profile);
//
////		attach into user
//		user.setProfileUrl(profile);
//
////		persist into database
//		user = saveUser(user);
//
//		return user.getProfileUrl();
//
//	}

	@Override
	public User getUserFromSignupRequest(UserSignupRequest signupRequest) {

//		signup credential 
		String email = Optional.ofNullable(signupRequest.getEmail()).orElse("").trim();
		String phone = Optional.ofNullable(signupRequest.getPhone()).orElse("").trim();

		Assert.isTrue(!phone.isEmpty() || !email.isEmpty(),
				"Users must have at least email or phone number to register!");

		User user = new User();

//		set email
		if (!email.equals("")) {
			Assert.isTrue(Util.isValidEmail(email), "Email is not valid");
			Assert.isTrue(isEmailUnique(email), "Email has already been taken.");
		}
		user.setEmail(email);

//		set phone
		if (!phone.equals("")) {
			PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");
			Assert.isTrue(isPhoneUnique(phone), "Phone has already been taken.");
		}
		user.setPhone(phone);

//		email Verified
		boolean isEmailVerified = Optional.ofNullable(signupRequest.isEmailVerified()).orElse(false);
		user.setEmailVerified(isEmailVerified);

//		phone Verified
		boolean isPhoneVerified = Optional.ofNullable(signupRequest.isPhoneVerified()).orElse(false);
		user.setPhoneVerified(isPhoneVerified);

//		set username
		String username = Optional.ofNullable(signupRequest.getUsername()).orElse("").trim();
		Assert.isTrue(!username.isEmpty(), "Preferred Name can't be empty!");
		user.setUsername(username);

//		set password 
		String password = Optional.ofNullable(signupRequest.getPassword()).orElse("").trim();
		user.setPassword(encodePassword(password, true));

//		user profile
		StorageDefault storageDefault = new StorageDefault();
		Storage picture = storageService.getStorage(storageDefault.getUserProfileDefault());
		user.setPicture(picture);

//		set status
		user.setStatus(UserStatus.ACTIVATED);

		return user;
	}

	@Override
	public User getUserFromGoogleSignupRequest(GoogleSignupRequest googleSignupRequest) {

		User user = new User();

		String password = Optional.ofNullable(googleSignupRequest.getSub().trim()).orElse("");
		user.setPassword(encodePassword(password, false));

//		user email
		String email = Optional.ofNullable(googleSignupRequest.getEmail().trim()).orElse("");
		Assert.isTrue(!email.isEmpty(), "Invalid Email Address!");
		user.setEmail(email);

//		firstname
		String firstname = Optional.ofNullable(googleSignupRequest.getGiven_name()).orElse("").trim();
		user.setFirstName(firstname);

//		lastname
		String lastname = Optional.ofNullable(googleSignupRequest.getFamily_name()).orElse("").trim();
		user.setLastName(lastname);

//		username
		String username = Optional.ofNullable(googleSignupRequest.getName()).orElse("").trim();
		user.setUsername(username);

//		if email verified
		boolean isEmailVerified = Optional.ofNullable(googleSignupRequest.isEmail_verified()).orElse(false);
		user.setEmailVerified(isEmailVerified);

//		user profile
		String pictureUrl = Optional.ofNullable(googleSignupRequest.getPicture()).orElse("").trim();
		Storage picture = null;

		if (pictureUrl.equals("")) {
//			add default picture
			StorageDefault storageDefault = new StorageDefault();
			picture = storageService.getStorage(storageDefault.getUserProfileDefault());
		} else {
			picture = new Storage();
			picture.setUrl(pictureUrl);
		}

//		persist picture
		picture = storageService.saveStorage(picture);

		user.setPicture(picture);

//		set provider
		user.setProvider("GOOGLE");

//		set status
		user.setStatus(UserStatus.ACTIVATED);

		return user;
	}

	@Override
	public User getUserFromAppleSignupRequest(AppleSignupRequest appleSignupRequest) {
		User user = new User();

		String password = Optional.ofNullable(appleSignupRequest.getSub().trim()).orElse("");
		user.setPassword(encodePassword(password, false));

//		user email
		String email = Optional.ofNullable(appleSignupRequest.getEmail().trim()).orElse("");
		Assert.isTrue(!email.isEmpty(), "Invalid Email Address!");
		user.setEmail(email);

//		username
		String username = Optional.ofNullable(appleSignupRequest.getName()).orElse("").trim();
		user.setUsername(username);

//		if email verified
		boolean isEmailVerified = Optional.ofNullable(appleSignupRequest.isEmail_verified()).orElse(false);
		user.setEmailVerified(isEmailVerified);

//		user profile
		StorageDefault storageDefault = new StorageDefault();
		Storage picture = storageService.getStorage(storageDefault.getUserProfileDefault());
		user.setPicture(picture);

//		set provider
		user.setProvider("APPLE");

//		set status
		user.setStatus(UserStatus.ACTIVATED);

		return user;
	}

	@Override
	public User getUserFromFacebookSignupRequest(FacebookSignupRequest facebookSignupRequest) {

		User user = new User();

		String password = Optional.ofNullable(facebookSignupRequest.getId().trim()).orElse("");
		user.setPassword(encodePassword(password, false));

//		user email
		String email = Optional.ofNullable(facebookSignupRequest.getEmail().trim()).orElse("");
		Assert.isTrue(!email.isEmpty(), "Invalid Email Address!");
		user.setEmail(email);

//		username
		String username = Optional.ofNullable(facebookSignupRequest.getName()).orElse("").trim();
		user.setUsername(username);

//		if email verified
		boolean isEmailVerified = Optional.ofNullable(facebookSignupRequest.isEmail_verified()).orElse(false);
		user.setEmailVerified(isEmailVerified);

//		user profile
		String pictureUrl = Optional.ofNullable(facebookSignupRequest.getPicture()).orElse("").trim();
		Storage picture = null;

		if (pictureUrl.equals("")) {
//			add default picture
			StorageDefault storageDefault = new StorageDefault();
			picture = storageService.getStorage(storageDefault.getUserProfileDefault());
		} else {
			picture = new Storage();
			picture.setUrl(pictureUrl);
		}

//		persist picture
		picture = storageService.saveStorage(picture);

		user.setPicture(picture);

//		set provider
		user.setProvider("FACEBOOK");

//		set status
		user.setStatus(UserStatus.ACTIVATED);

		return user;
	}

	@Override
	public String encodePassword(String password, boolean validate) {

		if (validate) {

			String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,20}$";
			Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
			Matcher matcher = pattern.matcher(password);

			Assert.isTrue(matcher.matches(), "8 to 20 characters (1 upper, 1 lower, 1 number, and no white space)");
		}

		return encoder.encode(password);
	}

	@Override
	public boolean isUsernameUnique(String username) {
		return userDao.isUsernameUnique(username);
	}

	@Override
	public boolean isEmailUnique(String email) {
		Assert.isTrue((new EmailValidator().isValid(email, null)), "Email is not valid");
		return userDao.isEmailUnique(email);
	}

	@Override
	public boolean isPhoneUnique(String phone) {
		PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");
		return userDao.isPhoneUnique(phone);
	}

	@Override
	public void remove(User account) {
		account.setStatus(UserStatus.DELETED);
		saveUser(account);
	}

	@Override
	public User getUserFromUpdateInfoRequest(User user, UserUpdateInfoRequest userUpdateInfoRequest) {

//		username
		String username = Optional.ofNullable(userUpdateInfoRequest.getUsername()).orElse(null);
		if (username != null) {
			Assert.isTrue(!username.isEmpty(), "Preferred Name can't be empty!");
			user.setUsername(username);
		}

//		first name
		String firstname = Optional.ofNullable(userUpdateInfoRequest.getFirstname()).orElse(null);
		if (firstname != null) {
			user.setFirstName(firstname);
		}

//		last name
		String lastname = Optional.ofNullable(userUpdateInfoRequest.getLastname()).orElse(null);
		if (lastname != null) {
			user.setLastName(lastname);
		}

//		new cover pictures
		List<StorageRequest> coverPictureRequests = Optional.ofNullable(userUpdateInfoRequest.getCoverPictures())
				.orElse(null);
		List<Storage> coverPictures = storageService.getStoragesFromStorageRequests(coverPictureRequests);
		if (coverPictures != null) {
			user.setCoverPictures(coverPictures);
		}

//		location
		String placeid = Optional.ofNullable(userUpdateInfoRequest.getPlaceid()).orElse(null);
		String address = Optional.ofNullable(userUpdateInfoRequest.getAddress()).orElse(null);
		Assert.isTrue(address != null ? placeid != null ? true : false : placeid == null ? true : false,
				"Invalid Location");
		if (placeid != null && address != null) {
			Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Invalid Location");
			user.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));
		}

//		public location
		Boolean isLocationPublic = Optional.ofNullable(userUpdateInfoRequest.getIsLocationPublic()).orElse(null);
		if (isLocationPublic != null) {
			user.setLocationPublic(isLocationPublic);
		}

//		email
		String email = Optional.ofNullable(userUpdateInfoRequest.getEmail()).orElse(null);
		if (email != null && !email.equals(user.getEmail())) {
			if (!email.isEmpty()) {
				Assert.isTrue(Util.isValidEmail(email), "Email is not valid");
				Assert.isTrue(isEmailUnique(email), "Email has already been taken.");
			}
			user.setEmail(email);
		}

//		phone
		String phone = Optional.ofNullable(userUpdateInfoRequest.getPhone()).orElse(null);
		if (phone != null && !phone.equals(user.getPhone())) {
			if (!phone.isEmpty()) {
				PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");
				Assert.isTrue(isPhoneUnique(phone), "Phone has already been taken.");
			}
			user.setPhone(phone);
		}

		Assert.isTrue(!user.getEmail().isEmpty() || !user.getPhone().isEmpty(),
				"Please provide at least email or phone. Both can't be empty!");

//		public email
		Boolean isEmailPublic = Optional.ofNullable(userUpdateInfoRequest.getIsEmailPublic()).orElse(null);
		if (isEmailPublic != null) {
			user.setEmailPublic(isEmailPublic);
		}
		
//		verify email
		Boolean isEmailVerified = Optional.ofNullable(userUpdateInfoRequest.getIsEmailVerified()).orElse(null);
		if (isEmailVerified != null) {
			user.setEmailVerified(isEmailVerified);
		}

//		public phone
		Boolean isPhonePublic = Optional.ofNullable(userUpdateInfoRequest.getIsPhonePublic()).orElse(null);
		if (isPhonePublic != null) {
			user.setPhonePublic(isPhonePublic);
		}
		
//		verify phone
		Boolean isPhoneVerified = Optional.ofNullable(userUpdateInfoRequest.getIsPhoneVerified()).orElse(null);
		if (isPhoneVerified != null) {
			user.setPhoneVerified(isPhoneVerified);
		}

//		description
		String description = Optional.ofNullable(userUpdateInfoRequest.getDescription()).orElse(null);
		if (description != null) {
			user.setDescription(description);
		}

//		public description
		Boolean isDescriptionPublic = Optional.ofNullable(userUpdateInfoRequest.getIsDescriptionPublic()).orElse(null);
		if (isDescriptionPublic != null) {
			user.setDescriptionPublic(isDescriptionPublic);
		}

//		website
		String website = Optional.ofNullable(userUpdateInfoRequest.getWebsite()).orElse(null);
		if (website != null) {
			if(!website.isEmpty()) {
				Assert.isTrue(Util.isValidUrl(website), "Invalid Website Address");
			}
			user.setWebsite(website);
		}

//		public website
		Boolean isWebsitePublic = Optional.ofNullable(userUpdateInfoRequest.getIsWebsitePublic()).orElse(null);
		if (isWebsitePublic != null) {
			user.setWebsitePublic(isWebsitePublic);
		}

		return user;
	}

}
