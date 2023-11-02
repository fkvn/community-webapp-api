package mono.thainow.service.impl;

import mono.thainow.dao.UserDao;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.storage.StorageDefault;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserProvider;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.rest.request.*;
import mono.thainow.service.LocationService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;
import mono.thainow.util.PhoneUtil;
import mono.thainow.util.Util;
import org.hibernate.validator.internal.constraintvalidators.bv.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

//	@Override
//	public List<User> getAllUsers() {
//		return userDao.getAllUsers();
//	}

    @Override
    public User findActiveUserByEmail(String email) {
        return userDao.findActiveUserByEmail(email);
    }

    @Override
    public User findActiveUserByPhone(String phone) {
        return userDao.findActiveUserByPhone(phone);
    }

    @Override
    public User findActiveUserBySub(String sub) {
        return userDao.findActiveUserBySub(sub);
    }

    @Override
    public User findUserById(Long id) {
        return userDao.findUserById(id);
    }

    @Override
    public User findActiveUserById(Long id) {
        return userDao.findActiveUserById(id);
    }

    @Override
    public User activateUser(User user) {
        user.setStatus(UserStatus.ACTIVATED);
        return saveUser(user);
    }

    @Override
    public User activateUserById(Long userId) {
        User user = findUserById(userId);
        user.setStatus(UserStatus.ACTIVATED);
        return saveUser(user);
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
    public User fetchUserFromUserRequest(User user, UserRequest request) {

        if (user == null) {
            user = new User();

//			set password 
            String password = Optional.ofNullable(request.getPassword()).orElse("").trim();
            user.setPassword(encodePassword(password, true));

//			user profile
            StorageDefault storageDefault = new StorageDefault();
            Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault());
            user.setPicture(picture);

//			set provider
            user.setProvider(UserProvider.THAINOW);

//			set status
            user.setStatus(UserStatus.ACTIVATED);
        }

//		credential 
        String email = Optional.ofNullable(request.getEmail()).orElse("").trim();
        String phone = Optional.ofNullable(request.getPhone()).orElse("").trim();

        Assert.isTrue(!phone.isBlank() || !email.isBlank(), "Please provide at least one email address or phone number.");

//		set email
        if (!email.isBlank() && user.getEmail() != null && !user.getEmail().equals(email)) {
            Assert.isTrue(user.getProvider().equals(UserProvider.THAINOW), "Update Error! This profile email is managed by " + user.getProvider() + " account.");
            Assert.isTrue(Util.isValidEmail(email), "Invalid Email");
            Assert.isTrue(isEmailUnique(email), "Email has already been taken.");
        }
        user.setEmail(email);

//		set phone
        if (!phone.isBlank() && user.getPhone() != null && !user.getPhone().equals(phone)) {
            PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");
            Assert.isTrue(isPhoneUnique(phone), "Phone has already been taken.");
        }
        user.setPhone(phone);

//		email Verified
        Boolean isEmailVerified = Optional.ofNullable(request.getIsEmailVerified()).orElse(false);
        user.setEmailVerified(isEmailVerified);

//		phone Verified
        Boolean isPhoneVerified = Optional.ofNullable(request.getIsPhoneVerified()).orElse(false);
        user.setPhoneVerified(isPhoneVerified);

//		set username
        String username = Optional.ofNullable(request.getUsername()).orElse("").trim();
        Assert.isTrue(!username.isBlank(), "Invalid Name!");
        user.setUsername(username);

//		location
        String address = Optional.ofNullable(request.getAddress()).orElse(null);
        String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);

//		since it's optional, only add if address is provided
        if (address != null)
            if (!address.isBlank()) user.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
            else user.setLocation(null);

//		public location
        Boolean isLocationPublic = Optional.ofNullable(request.getIsLocationPublic()).orElse(false);
        user.setLocationPublic(isLocationPublic);

//		description
        String description = Optional.ofNullable(request.getDescription()).orElse("").trim();
        user.setDescription(description.trim());

//		public description
        Boolean isDescriptionPublic = Optional.ofNullable(request.getIsDescriptionPublic()).orElse(false);
        user.setDescriptionPublic(isDescriptionPublic);

//		website
        String website = Optional.ofNullable(request.getWebsite()).orElse("").trim();
        if (!website.isBlank()) {
            Assert.isTrue(Util.isValidUrl(website), "Invalid Website Address");
        }
        user.setWebsite(website.trim());

//		public website
        Boolean isWebsitePublic = Optional.ofNullable(request.getIsWebsitePublic()).orElse(false);
        user.setWebsitePublic(isWebsitePublic);

        return user;
    }

    @Override
    public User fetchUserFromGoogleRequest(GoogleRequest request) {

        User user = new User();

        String password = Optional.ofNullable(request.getSub().trim()).orElse("").trim();
        user.setPassword(encodePassword(password, false));

//		user email
        String email = Optional.ofNullable(request.getEmail().trim()).orElse("").trim();
        Assert.isTrue(!email.isEmpty(), "Invalid Email!");
        user.setEmail(email);

//		firstname
        String firstname = Optional.ofNullable(request.getGiven_name()).orElse("").trim();
        user.setFirstName(firstname);

//		lastname
        String lastname = Optional.ofNullable(request.getFamily_name()).orElse("").trim();
        user.setLastName(lastname);

//		username
        String username = Optional.ofNullable(request.getName()).orElse("").trim();
        Assert.isTrue(!username.isBlank(), "Invalid Name!");
        user.setUsername(username);

//		if email verified
        Boolean isEmailVerified = Optional.ofNullable(request.getEmail_verified()).orElse(false);
        user.setEmailVerified(isEmailVerified);

//        user profile
        StorageDefault storageDefault = new StorageDefault();
        Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault());
        user.setPicture(picture);

//		set provider
        user.setProvider(UserProvider.GOOGLE);

//		set status
        user.setStatus(UserStatus.ACTIVATED);

        return user;
    }

    @Override
    public User fetchUserFromAppleRequest(AppleRequest request) {
        User user = new User();

        String password = Optional.ofNullable(request.getSub().trim()).orElse("").trim();
        user.setPassword(encodePassword(password, false));

//		user email
        String email = Optional.ofNullable(request.getEmail().trim()).orElse("").trim();
        Assert.isTrue(!email.isEmpty(), "Invalid Email!");
        user.setEmail(email);

//		username and if username is missing, using email instead
        String username = Optional.ofNullable(request.getName()).orElse(email).trim();
        Assert.isTrue(!username.isBlank(), "Invalid Name!");
        user.setUsername(username);

//		if email verified
        Boolean isEmailVerified = Optional.ofNullable(request.getEmail_verified()).orElse(false);
        user.setEmailVerified(isEmailVerified);

//		user profile
        StorageDefault storageDefault = new StorageDefault();
        Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault());
        user.setPicture(picture);

//		set provider
        user.setProvider(UserProvider.APPLE);

//		set status
        user.setStatus(UserStatus.ACTIVATED);

        return user;
    }

    @Override
    public User fetchUserFromFacebookRequest(FacebookRequest request) {

        User user = new User();

        String password = Optional.ofNullable(request.getId()).orElse("").trim();
        user.setPassword(encodePassword(password, false));

//		user email
        String email = Optional.ofNullable(request.getEmail()).orElse("").trim();
        Assert.isTrue(!email.isEmpty(), "Invalid Email!");
        user.setEmail(email);

//		username
        String username = Optional.ofNullable(request.getName()).orElse(email).trim();
        Assert.isTrue(!username.isBlank(), "Invalid Name!");
        user.setUsername(username);

//		if email verified
        Boolean isEmailVerified = Optional.ofNullable(request.getIsEmailVerified()).orElse(false);
        user.setEmailVerified(isEmailVerified);

//		user profile
        StorageDefault storageDefault = new StorageDefault();
        Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault());
        user.setPicture(picture);

//		set provider
        user.setProvider(UserProvider.FACEBOOK);

//		set status
        user.setStatus(UserStatus.ACTIVATED);

        return user;
    }

    @Override
    public User fetchUserFromLineRequest(LineRequest request) {
        User user = new User();

        String password = Optional.ofNullable(request.getSub().trim()).orElse("").trim();
        user.setPassword(encodePassword(password, false));

//		user email
        String email = Optional.ofNullable(request.getEmail().trim()).orElse("").trim();
        Assert.isTrue(!email.isEmpty(), "Invalid Email!");
        user.setEmail(email);


//		username
        String username = Optional.ofNullable(request.getName()).orElse("").trim();
        Assert.isTrue(!username.isBlank(), "Invalid Name!");
        user.setUsername(username);

//        user profile
        StorageDefault storageDefault = new StorageDefault();
        Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault());
        user.setPicture(picture);

//		set provider
        user.setProvider(UserProvider.LINE);

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

//	@Override
//	public User fetchUserFromUpdateRequest(User user, UserRequest request) {
//
////		username
//		String username = Optional.ofNullable(request.getUsername()).orElse(null);
//		if (username != null) {
//			Assert.isTrue(!username.isBlank(), "Invalid Name!");
//			user.setUsername(username.trim());
//		}
//
////		first name
//		String firstname = Optional.ofNullable(request.getFirstname()).orElse(null);
//		if (firstname != null) {
//			user.setFirstName(firstname.trim());
//		}
//
////		last name
//		String lastname = Optional.ofNullable(request.getLastname()).orElse(null);
//		if (lastname != null) {
//			user.setLastName(lastname.trim());
//		}
//
////		new cover pictures
//		List<StorageRequest> coverPictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
//		List<Storage> coverPictures = storageService.fetchStoragesFromRequests(coverPictureRequests);
//		if (coverPictures != null) {
//			user.setPictures(coverPictures);
//		}
//
////		location
//		String address = Optional.ofNullable(request.getAddress()).orElse(null);
//		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
//
////		since it's optional, only add if address is provided
//		if (address != null)
//			if (!address.isBlank())
//				user.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
//			else
//				user.setLocation(null);
//
////		public location
//		Boolean isLocationPublic = Optional.ofNullable(request.getIsLocationPublic()).orElse(null);
//		if (isLocationPublic != null) {
//			user.setLocationPublic(isLocationPublic); 
//		}
//
////		email
//		String email = Optional.ofNullable(request.getEmail()).orElse(null);
//		if (email != null && !email.equals(user.getEmail())) {
//			email = email.trim();
//			if (!email.isBlank()) {
//				Assert.isTrue(isEmailUnique(email), "Email has already been taken.");
//				Assert.isTrue(Util.isValidEmail(email), "Invalid Email");
//			}
//			user.setEmail(email);
//		}
//
////		phone
//		String phone = Optional.ofNullable(request.getPhone()).orElse(null);
//		if (phone != null && !phone.equals(user.getPhone())) {
//			phone = phone.trim();
//			if (!phone.isBlank()) {
//				Assert.isTrue(isPhoneUnique(phone), "Phone has already been taken.");
//				PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");
//			}
//			user.setPhone(phone);
//		}
//
//		Assert.isTrue(!user.getEmail().isEmpty() || !user.getPhone().isEmpty(),
//				"Please provide at least one email address or phone number.");
//
////		public email
//		Boolean isEmailPublic = Optional.ofNullable(request.getIsEmailPublic()).orElse(null);
//		if (isEmailPublic != null) {
//			user.setEmailPublic(isEmailPublic);
//		}
//
////		verify email
//		Boolean isEmailVerified = Optional.ofNullable(request.getIsEmailVerified()).orElse(null);
//		if (isEmailVerified != null) {
//			user.setEmailVerified(isEmailVerified);
//		}
//
////		public phone
//		Boolean isPhonePublic = Optional.ofNullable(request.getIsPhonePublic()).orElse(null);
//		if (isPhonePublic != null) {
//			user.setPhonePublic(isPhonePublic);
//		}
//
////		verify phone
//		Boolean isPhoneVerified = Optional.ofNullable(request.getIsPhoneVerified()).orElse(null);
//		if (isPhoneVerified != null) {
//			user.setPhoneVerified(isPhoneVerified);
//		}
//
////		description
//		String description = Optional.ofNullable(request.getDescription()).orElse(null);
//		if (description != null) {
//			user.setDescription(description.trim());
//		}
//
////		public description
//		Boolean isDescriptionPublic = Optional.ofNullable(request.getIsDescriptionPublic()).orElse(null);
//		if (isDescriptionPublic != null) {
//			user.setDescriptionPublic(isDescriptionPublic);
//		}
//
////		website
//		String website = Optional.ofNullable(request.getWebsite()).orElse(null);
//		if (website != null) {
//			if (!website.isEmpty()) {
//				Assert.isTrue(Util.isValidUrl(website), "Invalid Website Address");
//			}
//			user.setWebsite(website.trim());
//		}
//
////		public website
//		Boolean isWebsitePublic = Optional.ofNullable(request.getIsWebsitePublic()).orElse(null);
//		if (isWebsitePublic != null) {
//			user.setWebsitePublic(isWebsitePublic);
//		}
//
//		return user;
//	}

}
