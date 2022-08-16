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
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.rest.request.GoogleAuthRequest;
import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.service.UserService;
import mono.thainow.util.PhoneUtil;

@Service
@Primary
//@Qualifier
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private PasswordEncoder encoder;


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
			Assert.isTrue((new EmailValidator().isValid(email, null)), "Email is not valid");
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
		user.setPassword(encodePassword(password));

//		set status
		user.setStatus(UserStatus.ACTIVATED);

		return user;
	}

	@Override
	public User updateUserFromGoogleAuthRequest(User user, GoogleAuthRequest googleAuthRequest) {

		String email = Optional.ofNullable(googleAuthRequest.getEmail().trim()).orElse("");
		
//		user email
		user.setEmail(email);

//		firstname
		String firstname = Optional.ofNullable(googleAuthRequest.getGiven_name()).orElse("").trim();
		user.setFirstName(firstname);

//		lastname
		String lastname = Optional.ofNullable(googleAuthRequest.getFamily_name()).orElse("").trim();
		user.setLastName(lastname);

//		username
		String username = Optional.ofNullable(googleAuthRequest.getName()).orElse("").trim();
		user.setUsername(username);

//		if email verified
		boolean isEmailVerified = Optional.ofNullable(googleAuthRequest.isEmail_verified()).orElse(false);
		user.setEmailVerified(isEmailVerified);
		
//		set provider
		user.setProvider("GOOGLE");

		return user;
	}

	@Override
	public String encodePassword(String password) {

		String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,20}$";
		Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
		Matcher matcher = pattern.matcher(password);

		Assert.isTrue(matcher.matches(), "8 to 20 characters (1 upper, 1 lower, 1 number, and no white space)");

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

}
