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
import mono.thainow.domain.company.Company;
import mono.thainow.domain.user.BusinessUser;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserPrivilege;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.security.payload.request.SignUpRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.LocationService;
import mono.thainow.service.UserPrivilegeService;
import mono.thainow.service.UserService;
import mono.thainow.util.PhoneUtil;

@Service
@Primary
//@Qualifier
public class UserServiceImpl implements UserService {

	@Autowired
	private LocationService locationService;
	
	@Autowired
	private UserDao userDao;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private UserPrivilegeService userPrivilegeService;

	@Autowired
	private CompanyService compService;

//	=============================== Find User - Start ===============================

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Override
	public User getByUsername(String username) {
		return userDao.getByUsername(username);
	}

	@Override
	public User getByUserEmail(String email) {
		return userDao.getByUserEmail(email);
	}

	@Override
	public User getByUserPhone(String phone) {
		return userDao.getByUserPhone(phone);
	}

	@Override
	public User getByUserSub(String sub) {
		return userDao.getByUserSub(sub);
	}

	@Override
	public User getByUserId(Long id) {
		return userDao.getUser(id);
	}

//	=============================== Find User - End =============================== 

//	=============================== Modify User - Start =========================== 

	@Override
	public User saveUser(User user) {
		return userDao.saveUser(user);
	}

	@Override
	public void deleteUser(Long id) {
		User user = userDao.getUser(id);
		user.setStatus(UserStatus.DELETED);
		userDao.saveUser(user);
	}

	@Override
	public void removeUser(Long id) {
		userDao.removeUser(id);
	}

	@Override
	public Long updatePartialUser(Long id, Map<String, Object> userInfo) {

		User updatedUser = userDao.getUser(id);

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

		switch (role) {
		case BUSINESS:
			user = new BusinessUser();
			break;
		case CLASSIC:
			user = new User();
			break;
		default:
			break;
		}

//		assert that user is not null
		Assert.isTrue(user != null, "Failed Initialized User");

		return user;
	}

	@Override
	public User addBusinessCompanyFromSignUpRequest(User user, SignUpRequest signUpRequest) {

		try {

//			this method is for BUSINESS user only
			Assert.isTrue(user.getRole() == UserRole.BUSINESS, "Invalid User Type");

//			assert that user is persisted in the database
			Assert.isTrue(user.getId() != null, "Invalid User");

//			cast user
			BusinessUser businessUser = (BusinessUser) user;

//			initialize company
			Company company = Optional.ofNullable(signUpRequest.getCompany()).orElse(new Company());
			company = compService.createCompanyWithAdministrator(company, businessUser,
					signUpRequest.getCompany().getAdministratorRole());

//			add company to the business user list and assert that company is successfully added
			boolean isAddCompany = businessUser.getCompanies().add(company);
			Assert.isTrue(isAddCompany, "Failed Adding Company");

//			update business company list
			businessUser.setCompanies(businessUser.getCompanies());

			/*
			 * At this sign-up step, company is still pending, so business status would be
			 * DEACTIVED
			 */
			businessUser.setStatus(UserStatus.DEACTIVATED);

//			merge user into database
			user = saveUser(businessUser);

			return user;

		} catch (Exception ex) {

			/*
			 * At the moment - 4/16/22, if errors happened -> company is failed to add then
			 * register process would be failed and revert user, but the location is not
			 * affected
			 */

			ex.printStackTrace();

//			revert user
			userDao.removeUser(user.getId());

			return null;

		}
	}

	@Override
	public User getUserFromSignUpRequest(SignUpRequest signUpRequest) {

//		initialize user based on its role
		String role = Optional.ofNullable(signUpRequest.getRole()).orElse(null);
		User user = initializeUserByRole(UserRole.valueOf(role));

//		validate users' privileges
		Set<String> strPrivileges = signUpRequest.getPrivileges();
		Set<UserPrivilege> privileges = userPrivilegeService.verifyPrivileges(strPrivileges);

//		add user privileges
		user.setPrivileges(privileges);

//		user's profile information 
		String firstName = Optional.ofNullable(signUpRequest.getFirstname()).orElse(null);
		String lastName = Optional.ofNullable(signUpRequest.getLastname()).orElse(null);

//		add user profile information
		user.setFirstName(firstName);
		user.setLastName(lastName);

//		password validation
		Optional<String> password = Optional.ofNullable(signUpRequest.getPassword());
		user.setPassword(validateAndEncodeUserPassword(password.get()));

//		user email
		String email = Optional.ofNullable(signUpRequest.getEmail()).orElse("");
		user.setEmail(validateUserEmail(email));

//		email Verified
		boolean isEmailVerified = Optional.ofNullable(signUpRequest.isEmailVerified()).orElse(false);
		user.setEmailVerified(isEmailVerified);

//		user phone
		String phone = Optional.ofNullable(signUpRequest.getPhone()).orElse("");
		user.setPhone(validateUserPhone(phone));

//		phone Verified
		boolean isPhoneVerified = Optional.ofNullable(signUpRequest.isPhoneVerified()).orElse(false);
		user.setPhoneVerified(isPhoneVerified);

//		assert user has at least email or phone number
		Assert.isTrue(!phone.isEmpty() || !email.isEmpty(),
				"Users must have at least email or phone number to register!");

//		user location
		user.setLocation(locationService.getLocationFromSignUpRequest(signUpRequest));

//		initialize user status as DEACTIVATED
		user.setStatus(UserStatus.DEACTIVATED);

		return user;
	}

	@Override
	public String validateUserPhone(String phone) {
//		validate phone unique
		boolean isPhoneUnique = userDao.isPhoneUnique(phone);

		Assert.isTrue(isPhoneUnique, "Phone already existed!");

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
