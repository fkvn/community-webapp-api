package mono.thainow.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.jpa.LocationDaoImpl;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.UserRepository;
import mono.thainow.security.payload.request.SignupRequest;
import mono.thainow.service.UserService;
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
	private LocationDaoImpl locationDaoImpl;

//	=============================== Find User - Start ===============================

	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public Page<User> findUserPaginated(int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return userRepository.findAll(pageable);
	}

	@Override
	public User findByUsername(String username) {

		User user = entityManager.createQuery("from User where username =:username", User.class)
				.setParameter("username", username).getSingleResult();

		return user;
	}

	@Override
	public User findByUserEmail(String email) {

		User user = entityManager.createQuery("from User where email =:email", User.class).setParameter("email", email)
				.getSingleResult();

		return user;
	}

	@Override
	public User findByUserPhone(String phone) {

		User user = entityManager.createQuery("from User where phone =:phone", User.class).setParameter("phone", phone)
				.getSingleResult();

		return user;
	}

	@Override
	public User findByUserSub(String sub) {
		User user = entityManager.createQuery("from User where sub =:sub", User.class).setParameter("sub", sub)
				.getSingleResult();

		return user;
	}

//	=============================== Find User - End =============================== 

//	=============================== Modify User - Start =========================== 

	@Override
	@Transactional
	public User saveUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public void removeUser(Long id) {
		User user = userRepository.getById(id);
		user.setStatus(UserStatus.DELETED);
		userRepository.save(user);
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

	@Override
	public User findByUserId(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long createUser(String token, User user, User admin) {
		// TODO Auto-generated method stub
		return null;
	}

//	=============================== Modify User - End ===============================

//	=============================== Business Service - start ===============================

	@Override
	public User getClassicUser(User user, SignupRequest signUpRequest) {

//		user email
		String email = Optional.ofNullable(signUpRequest.getEmail()).orElse(null);
		boolean isEmailVerified = Optional.ofNullable(signUpRequest.isEmailVerified()).orElse(false);
		user.setEmail(email);
		user.setEmailVerified(isEmailVerified);

//		user phone
		String phone = Optional.ofNullable(signUpRequest.getPhone()).orElse(null);
		boolean isPhoneVerified = Optional.ofNullable(signUpRequest.isPhoneVerified()).orElse(false);
		user.setPhone(phone);
		user.setPhoneVerified(isPhoneVerified);

//		assert user has at least email or phone number
		Assert.isTrue(!phone.isEmpty() && !email.isEmpty(), "Users must have at least email or phone number to register!");
 
//		user location
		Location location = Optional.ofNullable(signUpRequest.getLocation()).orElse(new Location());
		
//		assert location has city, state, and zipcode
		Assert.isTrue(!location.getLocality().equals("") && !location.getState().equals("")
				&& !location.getZipcode().equals(""), "City, State, and Zipcode can't be empty");
		
//		check if location is in the database
		Location dbLocation = locationDaoImpl.findLocationByLatLng(location.getPlaceid(), location.getLat(), location.getLng());
		
//		new location
		if (dbLocation == null) {
			location = locationDaoImpl.saveLocation(location);
			user.setLocation(location);
		}
//		existed location
		else {
			user.setLocation(dbLocation);
		}
		

		return user;
	}

//	=============================== Business Service - End ===============================

}
