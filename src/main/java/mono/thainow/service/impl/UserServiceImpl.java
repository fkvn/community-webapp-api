package mono.thainow.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.CompanyDao;
import mono.thainow.dao.LocationDao;
import mono.thainow.dao.UserDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.BusinessUser;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserPrivilege;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.UserRepository;
import mono.thainow.security.payload.request.SignupRequest;
import mono.thainow.service.UserPrivilegeService;
import mono.thainow.service.UserService;
import mono.thainow.util.PasswordUtil;
import mono.thainow.util.PhoneUtil;

@Service
@Primary
//@Qualifier
public class UserServiceImpl implements UserService {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserDao userDao;

	@Autowired
	private LocationDao locationDao;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	private UserPrivilegeService userRoleService;

	@Autowired
	private CompanyDao companyDao;

//	=============================== Find User - Start ===============================

	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public Page<User> getUserPaginated(int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return userRepository.findAll(pageable);
	}

	@Override
	public User getByUsername(String username) {

		User user = entityManager.createQuery("from User where username =:username", User.class)
				.setParameter("username", username).getSingleResult();

		return user;
	}

	@Override
	public User getByUserEmail(String email) {

		User user = entityManager.createQuery("from User where email =:email", User.class).setParameter("email", email)
				.getSingleResult();

		return user;
	}

	@Override
	public User getByUserPhone(String phone) {

		User user = entityManager.createQuery("from User where phone =:phone", User.class).setParameter("phone", phone)
				.getSingleResult();

		return user;
	}

	@Override
	public User getByUserSub(String sub) {
		User user = entityManager.createQuery("from User where sub =:sub", User.class).setParameter("sub", sub)
				.getSingleResult();

		return user;
	}
	
	@Override
	public User getByUserId(Long id) {
		return userDao.getUser(id);
	}

//	=============================== Find User - End =============================== 

//	=============================== Modify User - Start =========================== 

	@Override
	@Transactional
	public User saveUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public void deleteUser(Long id) {
		User user = userRepository.getById(id);
		user.setStatus(UserStatus.DELETED);
		userRepository.save(user);
	}

	@Override
	public void removeUser(Long id) {
		userDao.removeUser(id);
	}

	@Override
	public Long updatePartialUser(Long id, Map<String, Object> userInfo) {

		User updatedUser = userRepository.getById(id);

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

		updatedUser = userRepository.save(updatedUser);

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
	public User saveUserFromSignUpInfo(User user, SignupRequest signUpRequest) {

//		validate users' privileges
		Set<String> strPrivileges = signUpRequest.getPrivileges();

		Set<UserPrivilege> privileges = userRoleService.verifyPrivileges(strPrivileges);

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
		PasswordUtil.verifyPassword(password.get());

		// password encoded
		String encodedPwd = encoder.encode(password.get());

//		add user password
		user.setPassword(encodedPwd);

//		user email
		String email = Optional.ofNullable(signUpRequest.getEmail()).orElse(null);
		
//		validate email unique
		boolean isEmailUnique = userDao.isEmailUnique(email);
		Assert.isTrue(isEmailUnique, "Email already existed!");
		user.setEmail(email);
		
//		email Verified
		boolean isEmailVerified = Optional.ofNullable(signUpRequest.isEmailVerified()).orElse(false);
		user.setEmailVerified(isEmailVerified);

//		user phone
		String phone = Optional.ofNullable(signUpRequest.getPhone()).orElse(null);
		
//		validate phone unique
		boolean isPhoneUnique = userDao.isPhoneUnique(phone);
		Assert.isTrue(isPhoneUnique, "Phone already existed!");
		user.setPhone(phone);

//		phone Verified
		boolean isPhoneVerified = Optional.ofNullable(signUpRequest.isPhoneVerified()).orElse(false);
		user.setPhoneVerified(isPhoneVerified);

//		assert user has at least email or phone number
		Assert.isTrue(!phone.isEmpty() && !email.isEmpty(),
				"Users must have at least email or phone number to register!");

//		user location
		Location location = Optional.ofNullable(signUpRequest.getLocation()).orElse(new Location());

//		assert location has city, state, and zipcode
		Assert.isTrue(!location.getLocality().equals("") && !location.getState().equals("")
				&& !location.getZipcode().equals(""), "City, State, and Zipcode can't be empty");

//		check if location is in the database
		Location dbLocation = locationDao.findLocationByLatLng(location.getPlaceid(), location.getLat(),
				location.getLng());

//		new location
		if (dbLocation == null) {
//			save location to database to persist
			location = locationDao.saveLocation(location);

//			set location to user
			user.setLocation(location);
		}
//		existed location
		else {
			user.setLocation(dbLocation);
		}

//		update user status
		user.setStatus(UserStatus.ACTIVE);

//		persist user to database
		user = saveUser(user);


//		update user sub
		String sub = encoder.encode(user.getId().toString());
		user.setSub(sub);

//		merge user to database
		user = saveUser(user);

		return user;
	}

	@Override
	public User updateBusinessUserFromSignUpInfo(User user, SignupRequest signUpRequest) {

		try {

//		this method is for BUSINESS user only
			Assert.isTrue(user.getRole() == UserRole.BUSINESS, "Invalid User Type");

//		assert that user is persisted in the database
			Assert.isTrue(user.getId() != null, "Invalid User");

//		cast user
			BusinessUser businessUser = (BusinessUser) user;

//		Company info
			Company company = Optional.ofNullable(signUpRequest.getCompany()).orElse(new Company());

//		Company Location at the moment is the same with the user - 4/16/22
			company.setLocation(user.getLocation());

//		Company email at the moment is the same with the user - 4/16/22
			company.setEmail(user.getEmail());
			company.setEmailVerified(user.isEmailVerified());

//		Company phone at the moment is the same with the user - 4/16/22
			company.setPhone(user.getPhone());
			company.setPhoneVerified(user.isPhoneVerified());

//		update administrator
			company.setAdministrator(businessUser);

//		company status as Pending WHEN sign-up 
			company.setStatus(CompanyStatus.PENDING);

			/*
			 * At this sign-up step, the company is still pending, so we persist it into
			 * database no matter
			 */

			company = companyDao.saveCompany(company);

//		add company to the business user list and assert that company is successfully added
			boolean isAddCompany = businessUser.getCompanies().add(company);
			Assert.isTrue(isAddCompany, "Failed Adding Company");

//		update business company list
			businessUser.setCompanies(businessUser.getCompanies());

			/*
			 * At this sign-up step, company is still pending, so business status would be
			 * DEACTIVED
			 */
			businessUser.setStatus(UserStatus.DEACTIVATED);

//		merge user into database
			user = saveUser(businessUser);

			return user;
			
		} catch (Exception ex) {
			
			/*
			 * At the moment - 4/16/22, if errors happened -> company is failed to add
			 * then register process would be failed and revert user, but the location is not affected
			 */
			
			ex.printStackTrace();
			
//			revert user
			userDao.removeUser(user.getId());

			return null;

		}
	}

//	=============================== Business Service - End ===============================

}
