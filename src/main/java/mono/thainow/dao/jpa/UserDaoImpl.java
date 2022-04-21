package mono.thainow.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mono.thainow.dao.UserDao;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.UserRepository;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Autowired
	private UserRepository userRepository;

//	=============================================

	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public List<User> getAllActiveUser() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUser(long id) {
		return entityManager.find(User.class, id);
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

//	=====================================================

	@Override
	@Transactional
	public User saveUser(User user) {
		return entityManager.merge(user);
	}

	@Override
	@Transactional
	public void removeUser(long id) {
		User user = entityManager.find(User.class, id);
		entityManager.remove(user);
	}
	
//	=====================================================

	@Override
	public boolean isEmailUnique(String email) {
		try {

			/*
			 * if no error, means active user with the given email existed -> return false
			 * 
			 * We don't check email unique for users who are NOT ACTIVE
			 */
			entityManager.createQuery("from User where status =:status and email =:email", Location.class)
					.setParameter("status", UserStatus.ACTIVATED).setParameter("email", email).getSingleResult();

			return false;

		} catch (Exception ex) {
//			email is available
			return true;
		}
	}

	@Override
	public boolean isPhoneUnique(String phone) {
		try {

			/*
			 * if no error, means active user with the given phone existed -> return false
			 * 
			 * We don't check phone unique for users who are NOT ACTIVE
			 */
			entityManager.createQuery("from User where status =:status and phone =:phone", Location.class)
					.setParameter("status", UserStatus.ACTIVATED).setParameter("phone", phone).getSingleResult();

			return false;

		} catch (Exception ex) {
//			phone is available
			return true;
		}
	}

}
