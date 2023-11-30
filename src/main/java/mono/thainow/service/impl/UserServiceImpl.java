package mono.thainow.service.impl;

import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.storage.StorageDefault;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserProvider;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.exception.BadRequest;
import mono.thainow.repository.UserRepository;
import mono.thainow.rest.request.*;
import mono.thainow.service.*;
import mono.thainow.util.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.NoSuchElementException;
import java.util.Optional;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private EmailService emailService;

    @Autowired
    private PhoneService phoneService;

    @Autowired
    private StorageService storageService;

    @Autowired
    private LocationService locationService;

    @Autowired
    private PasswordService passwordService;

    //	=============================================================

    @Override
    public Optional<User> findUserById(Long id) {
        return userRepository.findById(id);
    }

    @Override
    public Optional<User> findUserByEmail(String email) {
        return userRepository.findByEmailAndStatusNot(email, UserStatus.DELETED);
    }

    @Override
    public Optional<User> findUserByPhone(String phone, String region) {
        return userRepository.findByPhoneAndPhoneRegionAndStatusNot(phone, region, UserStatus.DELETED);
    }

    @Override
    public Optional<User> findUserBySub(String sub) {
        return userRepository.findBySubAndStatusNot(sub, UserStatus.DELETED);
    }

    //	=============================================================
    @Override
    public Optional<User> findActiveUserById(Long id) {
        Optional<User> user = findUserById(id);
        if (user.isPresent()) {
            if (user.get().getStatus().equals(UserStatus.DISABLED))
                throw new BadRequest("This account is disabled. Please contact the administrators!");

            if (!user.get().getStatus().equals(UserStatus.ACTIVATED)) {
                throw new NoSuchElementException();
            }
        }
        return user;
    }

    @Override
    public Optional<User> findActiveUserByEmail(String email) {
        Optional<User> user = findUserByEmail(email);
        if (user.isPresent()) {
            if (user.get().getStatus().equals(UserStatus.DISABLED))
                throw new BadRequest("This account is disabled. Please contact the administrators!");

            if (!user.get().getStatus().equals(UserStatus.ACTIVATED)) {
                throw new NoSuchElementException();
            }
        }
        return user;
    }

    @Override
    public Optional<User> findActiveUserByPhone(String phone, String region) {
        Optional<User> user = findUserByPhone(phone, region);
        if (user.isPresent()) {
            if (user.get().getStatus().equals(UserStatus.DISABLED))
                throw new BadRequest("This account is disabled. Please contact the administrators!");

            if (!user.get().getStatus().equals(UserStatus.ACTIVATED)) {
                throw new NoSuchElementException();
            }
        }
        return user;
    }

    @Override
    public Optional<User> findActiveUserBySub(String sub) {
        Optional<User> user = findUserBySub(sub);
        if (user.isPresent()) {
            if (user.get().getStatus().equals(UserStatus.DISABLED))
                throw new BadRequest("This account is disabled. Please contact the administrators!");

            if (!user.get().getStatus().equals(UserStatus.ACTIVATED)) {
                throw new NoSuchElementException();
            }
        }
        return user;
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
            String password = request.getPassword();
            user.setPassword(passwordService.encodePassword(passwordService.validatePassword(password)));

//			user profile
            StorageDefault storageDefault = new StorageDefault();
            Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault()).orElseGet(null);
            user.setPicture(picture);

//			set provider
            user.setProvider(UserProvider.THAINOW);

//			set status
            user.setStatus(UserStatus.ACTIVATED);
        }

//		credential 
        String email = Optional.ofNullable(request.getEmail()).orElse("")
                .trim();
        String phone = Optional.ofNullable(request.getPhone()).orElse("")
                .trim();

        Assert.isTrue(!phone.isBlank() || !email.isBlank(),
                "Please provide at least one email address or phone number.");

//		set email
        if (!email.isBlank() && user.getEmail() != null &&
                !user.getEmail().equals(email)) {
            Assert.isTrue(user.getProvider().equals(UserProvider.THAINOW),
                    "This profile email is managed by " +
                            user.getProvider() + " account.");
            Assert.isTrue(!emailService.isEmailExisting(email),
                    "Email has already been taken.");
        }
        user.setEmail(email);

//		set phone
        if (!phone.isBlank() && user.getPhone() != null &&
                !user.getPhone().equals(phone)) {
            String phoneRegion = Optional.ofNullable(request.getPhoneRegion()).orElse("US")
                    .trim();
            Assert.isTrue(phoneService.isPhoneRegionValid(phoneRegion),
                    "Region must has exactly 2 characters");
            Assert.isTrue(!phoneService.isPhoneExisting(phone, phoneRegion),
                    "Phone has already been taken.");
        }
        user.setPhone(phone);

//		email Verified
        Boolean isEmailVerified = Optional.ofNullable(
                request.getIsEmailVerified()).orElse(false);
        user.setEmailVerified(isEmailVerified);

//		phone Verified
        Boolean isPhoneVerified = Optional.ofNullable(
                request.getIsPhoneVerified()).orElse(false);
        user.setPhoneVerified(isPhoneVerified);


        //		set firstname
        String firstname = Optional.ofNullable(request.getFirstname()).orElse("")
                .trim();
        user.setUsername(firstname);

        //		set lastname
        String lastname = Optional.ofNullable(request.getLastname()).orElse("")
                .trim();
        user.setUsername(lastname);

//		set username
        String username = Optional.ofNullable(request.getUsername())
                .orElse((firstname.isBlank() && lastname.isBlank() ? email : String.format("%s %s", firstname, lastname)))
                .trim();
        Assert.isTrue(!username.isBlank(), "Invalid Name!");
        user.setUsername(username);

//		location
        String address = request.getAddress();
        String placeid = Optional.ofNullable(request.getPlaceid()).orElse("");

//		since it's optional, only add if address is provided
        if (!address.isBlank()) {
            user.setLocation(locationService.findLocationByPlaceidOrAddress(placeid, address));
        } else user.setLocation(null);

//		public location
        Boolean isLocationPublic = Optional.ofNullable(
                request.getIsLocationPublic()).orElse(false);
        user.setLocationPublic(isLocationPublic);

//		description
        String description = Optional.ofNullable(request.getDescription())
                .orElse("").trim();
        user.setDescription(description.trim());

//		public description
        Boolean isDescriptionPublic = Optional.ofNullable(
                request.getIsDescriptionPublic()).orElse(false);
        user.setDescriptionPublic(isDescriptionPublic);

//		website
        String website = Optional.ofNullable(request.getWebsite()).orElse("")
                .trim();
        if (!website.isBlank()) {
            Assert.isTrue(Util.isValidUrl(website), "Invalid Website Address");
        }
        user.setWebsite(website.trim());

//		public website
        Boolean isWebsitePublic = Optional.ofNullable(
                request.getIsWebsitePublic()).orElse(false);
        user.setWebsitePublic(isWebsitePublic);

        return user;
    }

    @Override
    public User fetchNewUserFromAccessByGoogleRequest(AccessByGoogleRequest request) {

        User user = new User();

        String email = request.getEmail();
        String password = request.getSub();

        Assert.isTrue(!password.isBlank() && !email.isBlank(), "Invalid credentials!");

        user.setEmail(email);
        user.setPassword(passwordService.encodePassword(password));

        String username = Optional.ofNullable(request.getName()).orElse(email).trim();
        user.setUsername(username);

        String firstname = request.getGiven_name();
        user.setFirstName(firstname);

        String lastname = request.getFamily_name();
        user.setLastName(lastname);

        Boolean isEmailVerified = Optional.ofNullable(request.getEmail_verified()).orElse(false);
        user.setEmailVerified(isEmailVerified);

        StorageDefault storageDefault = new StorageDefault();
        Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault()).orElseGet(null);
        user.setPicture(picture);

        user.setProvider(UserProvider.GOOGLE);

        user.setStatus(UserStatus.ACTIVATED);

        return user;
    }

    @Override
    public User fetchNewUserFromAccessByAppleRequest(AccessByAppleRequest request) {
        User user = new User();

        String email = request.getEmail();
        String password = request.getSub();

        Assert.isTrue(!password.isBlank() && !email.isBlank(), "Invalid credentials!");

        user.setEmail(email);
        user.setPassword(passwordService.encodePassword(password));

        String username = Optional.ofNullable(request.getName()).orElse(email).trim();
        user.setUsername(username);

        Boolean isEmailVerified = Optional.ofNullable(request.getEmail_verified()).orElse(false);
        user.setEmailVerified(isEmailVerified);

        StorageDefault storageDefault = new StorageDefault();
        Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault()).orElseGet(null);
        user.setPicture(picture);

        user.setProvider(UserProvider.APPLE);

        user.setStatus(UserStatus.ACTIVATED);

        return user;
    }

    @Override
    public User fetchNewUserFromAccessByFacebookRequest(AccessByFacebookRequest request) {

        User user = new User();

        String email = request.getEmail();
        String password = request.getId();

        Assert.isTrue(!password.isBlank() && !email.isBlank(), "Invalid credentials!");

        user.setEmail(email);
        user.setPassword(passwordService.encodePassword(password));

        String username = Optional.ofNullable(request.getName()).orElse(email).trim();
        user.setUsername(username);


        Boolean isEmailVerified = Optional.ofNullable(request.getIsEmailVerified()).orElse(false);
        user.setEmailVerified(isEmailVerified);

        StorageDefault storageDefault = new StorageDefault();
        Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault()).orElseGet(null);
        user.setPicture(picture);

        user.setProvider(UserProvider.FACEBOOK);

        user.setStatus(UserStatus.ACTIVATED);

        return user;
    }

    @Override
    public User fetchNewUserFromAccessByLineRequest(AccessByLineRequest request) {
        User user = new User();

        String email = request.getEmail();
        String password = request.getSub();

        Assert.isTrue(!password.isBlank() && !email.isBlank(), "Invalid credentials!");

        user.setEmail(email);
        user.setPassword(passwordService.encodePassword(password));

        String username = Optional.ofNullable(request.getName()).orElse(email).trim();
        user.setUsername(username);

        StorageDefault storageDefault = new StorageDefault();
        Storage picture = storageService.findStorageById(storageDefault.getUserProfileDefault()).orElseGet(null);
        user.setPicture(picture);

        user.setProvider(UserProvider.LINE);

        user.setStatus(UserStatus.ACTIVATED);

        return user;
    }

//    @Override
//    public String encodePassword(String password, boolean validate) {
//
//        if (validate) {
//
//            String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,20}$";
//            Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
//            Matcher matcher = pattern.matcher(password);
//
//            Assert.isTrue(matcher.matches(),
//                    "8 to 20 characters (1 upper, 1 lower, 1 number, and no white space)");
//        }
//
//        return encoder.encode(password);
//    }

    @Override
    public void activateUserById(Long id) {
        Optional<User> user = userRepository.findById(id);
        user.get().setStatus(UserStatus.ACTIVATED);
        saveUser(user.get());
    }

    @Override
    public User saveUser(User user) {
        return userRepository.save(user);
    }

    @Override
    public void remove(User account) {
        account.setStatus(UserStatus.DELETED);
        saveUser(account);
    }

    @Override
    public void changePassword(Long userId, String password) {

        Assert.isTrue(!password.isBlank(), "Invalid credentials");

        User user = findUserById(userId).get();

        Assert.isTrue(user.getProvider().equals(UserProvider.THAINOW), String.format("Change Password Failed! This profile is managed by %s.", user.getProvider()));

        user.setPassword(passwordService.encodePassword(passwordService.validatePassword(password)));

        saveUser(user);
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
