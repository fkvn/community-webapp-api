package mono.thainow.service.impl;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.UserRepository;
import mono.thainow.service.UserService;
import mono.thainow.util.util;

@Service
@Primary
//@Qualifier
public class UserServiceDashboardImpl implements UserService {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private UserRepository userRepository;

	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public String getAllUsers(String token) {

		String users = this.getAllUsers(token);

		return users;
	}

	@Override
	public Page<User> findUserPaginated(int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return userRepository.findAll(pageable);
	}

	@Override
	public User getUserById(Long id) {
		return userRepository.getById(id);
	}

	@Override
	public User findByUsername(String username) {
		
		User user = entityManager.createQuery("from User where username =:username", User.class)
				.setParameter("username", username).getSingleResult();
		
		return user;
	}
	
	@Override
	public User findByUserEmail(String email) {

		User user = entityManager.createQuery("from User where email =:email", User.class)
				.setParameter("email", email).getSingleResult();
		
		return user;
	}

	@Override
	public User findByUserPhone(String phone) {

		User user = entityManager.createQuery("from User where phone =:phone", User.class)
				.setParameter("phone", phone).getSingleResult();
		
		return user;
	}

	@Override
	@Transactional
	public User saveUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public Long createUser(String token, User user, User admin) {
		// TODO Auto-generated method stub
		System.out.println("call back internal");
		return null;
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
				util.valPhoneNo(String.valueOf(userInfo.get(key)));
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



}
