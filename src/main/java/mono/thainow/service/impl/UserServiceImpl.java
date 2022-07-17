package mono.thainow.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.UserDao;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.storage.StorageDefault;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserPrivilege;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.security.payload.request.SignupRequest;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserPrivilegeService;
import mono.thainow.service.UserRoleService;
import mono.thainow.service.UserService;
import mono.thainow.util.PhoneUtil;

@Service
@Primary
//@Qualifier
public class UserServiceImpl implements UserService {

//	@Autowired
//	private LocationService locationService;

	@Autowired
	private UserDao userDao;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private UserPrivilegeService userPrivilegeService;

	@Autowired
	private UserRoleService userRoleService;

	@Autowired
	private StorageService storageService;

//	=============================== Find User - Start ===============================

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public User getActiveUserByUsername(String username) {
		return userDao.getActiveUserByUsername(username);
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

//	=============================== Find User - End =============================== 

//	=============================== Modify User - Start =========================== 

	@Override
	public User addBusinessCompanyFromSignUpRequest(User user, SignupRequest signUpRequest) {

//		try {
//
////			this method is for BUSINESS user only
//			Assert.isTrue(user.getRole() == UserRole.BUSINESS, "Invalid User Type");
//
////			assert that user is persisted in the database
//			Assert.isTrue(user.getId() != null, "Invalid User");
//
////			cast user
//			BusinessUser businessUser = (BusinessUser) user;
//
////			initialize company
//			Company company = Optional.ofNullable(signUpRequest.getCompany()).orElse(new Company());
//			company = companyService.createCompanyWithAdministrator(company, businessUser,
//					signUpRequest.getCompany().getAdministratorRole());
//
////			add company to the business user list and assert that company is successfully added
//			boolean isAddCompany = businessUser.getCompanies().add(company);
//			Assert.isTrue(isAddCompany, "Failed Adding Company");
//
////			update business company list
//			businessUser.setCompanies(businessUser.getCompanies());
//
//			/*
//			 * At this sign-up step, company is still pending, so business status would be
//			 * DEACTIVED
//			 */
//			businessUser.setStatus(UserStatus.DEACTIVATED);
//
////			merge user into database
//			user = saveUser(businessUser);
//
//			return user;
//
//		} catch (Exception ex) {
//
//			/*
//			 * At the moment - 4/16/22, if errors happened -> company is failed to add then
//			 * register process would be failed and revert user, but the location is not
//			 * affected
//			 */
//
//			ex.printStackTrace();
//
////			revert user
//			userDao.removeUser(user.getId());
//
//			return null;
//
//		}

		return null;
	}

	@Override
	public User uploadProfilePicture(User user, StorageRequest storageRequest) {

//		persist storage into database
		Storage profile = new Storage();

		profile.setName(storageRequest.getName());
		profile.setType(storageRequest.getType());
		profile.setUrl(storageRequest.getUrl());
		profile.setSize(storageRequest.getSize());

		profile = storageService.saveStorage(profile);

//		attach into user
		user.setProfileUrl(profile);

//		persist into database
		user = saveUser(user);

		return user;

	}

	@Override
	public User saveUser(User user) {
		return userDao.saveUser(user);
	}

	@Override
	public void deleteUser(Long id) {
		User user = userDao.getUserById(id);
		user.setStatus(UserStatus.DELETED);
		userDao.saveUser(user);
	}

	@Override
	public void removeUser(Long id) {
		userDao.removeUser(id);
	}

	@Override
	public Long updatePartialUser(Long id, Map<String, Object> userInfo) {

		User updatedUser = userDao.getUserById(id);

		for (String key : userInfo.keySet()) {
			switch (key) {
			case "password":
//				updatedUser.setPassword(util.encodeString((String) userInfo.get(key)));
				break;
			case "email":
				updatedUser.setEmail((String) userInfo.get(key));
				break;
			case "phone": {
				PhoneUtil.validatePhoneNumberWithGoogleAPI(String.valueOf(userInfo.get(key)), "US");
				updatedUser.setPhone(String.valueOf(userInfo.get(key)));
			}
				break;
			case "status":
				updatedUser.setStatus(UserStatus.valueOf((String) userInfo.get(key)));
				break;
			default:
			}
		}

		updatedUser = userDao.saveUser(updatedUser);

		return updatedUser.getId();
	}

//	=============================== Modify User - End ===============================

//	=============================== Business Service - start ===============================

	@Override
	public User initializeUserByRole(UserRole role) {

		User user = null;

//		switch (role) {
//		case BUSINESS:
//			user = new BusinessUser();
//			break;
//		case CLASSIC:
//			user = new ClassicUser();
//			break;
//		default:
//			user = new User();
//			break;
//		}

//		assert that user is not null
		Assert.isTrue(user != null, "Failed Initialized User");

		return user;
	}

	@Override
	public User getUserFromSignUpRequest(SignupRequest signUpRequest) {

		User user = new User();
		
//		verify role and initialize user based on its role
		String roleName = Optional.ofNullable(signUpRequest.getRole()).orElse("").trim();
//		User user = initializeUserByRole(UserRole.valueOf(roleName));
		UserRole role = userRoleService.verifyRoles(roleName);
//		User user = initializeUserByRole(role);
		user.setRole(role);

//		validate users' privileges
		Set<String> strPrivileges = signUpRequest.getPrivileges();
		Set<UserPrivilege> privileges = userPrivilegeService.verifyPrivileges(strPrivileges);

//		add user privileges
		user.setPrivileges(privileges);

//		username
		String username = Optional.ofNullable(signUpRequest.getUsername()).orElse("").trim();
		Assert.isTrue(!username.isEmpty(), "Invalid Preferred Name");
		user.setUsername(validateUsername(username));

//		password validation
		String password = Optional.ofNullable(signUpRequest.getPassword()).orElse("").trim();
		user.setPassword(validateAndEncodeUserPassword(password));

//		user email
		String email = Optional.ofNullable(signUpRequest.getEmail()).orElse("").trim();
		Assert.isTrue(email.length() <= 50, "Email can't be more than 50 characters");
		user.setEmail(validateUserEmail(email));

//		email Verified
		boolean isEmailVerified = Optional.ofNullable(signUpRequest.isEmailVerified()).orElse(false);
		user.setEmailVerified(isEmailVerified);
 
//		user phone
		String phone = Optional.ofNullable(signUpRequest.getPhone()).orElse("").trim();
//		phone is optional as default
		Assert.isTrue(phone.length() == 14 || phone.length() == 0,
				"Invalid Phone Number! Phone number must be in format (xxx) xxx-xxxx");
		user.setPhone(validateUserPhone(phone));

//		phone Verified
		boolean isPhoneVerified = Optional.ofNullable(signUpRequest.isPhoneVerified()).orElse(false);
		user.setPhoneVerified(isPhoneVerified);

//		login credential 
		Assert.isTrue(!phone.isEmpty() || !email.isEmpty(),
				"Users must have at least email or phone number to register!");
		
//		user location
//		String placeid = Optional.ofNullable(signUpRequest.getPlaceid()).orElse("");
//		String address = Optional.ofNullable(signUpRequest.getAddress()).orElse("");
//		if (!placeid.isEmpty() && !address.isEmpty()) {
//			user.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));
//		}
		

//		user profile
		StorageDefault storageDefault = new StorageDefault();
		Storage profile = storageService.getStorage(storageDefault.getUserProfileDefault());
		user.setProfileUrl(profile);

//		user status
		user.setStatus(UserStatus.ACTIVATED);

		return user;
	}

	
	@Override
	public String validateUsername(String username) {
		
		boolean isUsernameUnique = userDao.isUsernameUnique(username);
		
		Assert.isTrue(isUsernameUnique, "Username already existed");
		
		return username;
	}
	
	@Override
	public String validateUserPhone(String phone) {
//		validate phone unique
		boolean isPhoneUnique = userDao.isPhoneUnique(phone);

		Assert.isTrue(isPhoneUnique, "Phone already existed!");

//		validate phone number
		PhoneUtil.validatePhoneNumberWithGoogleAPI(phone, "US");

		return phone;
	}

	@Override
	public String validateUserEmail(String email) {
//		validate email unique
		boolean isEmailUnique = userDao.isEmailUnique(email);

		Assert.isTrue(isEmailUnique, "Email already existed!");

		return email;
	}

	@Override
	public String validateAndEncodeUserPassword(String password) {

		String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,20}$";

		Assert.isTrue(password.matches(passwordRegex),
				"Your password must be between 8 and 20 characters (at least 1 upper, 1 lower, 1 number, and no white space)");

		// password encoded
		String encodedPwd = encoder.encode(password);

		return encodedPwd;
	}



//	=============================== Business Service - End ===============================

}
