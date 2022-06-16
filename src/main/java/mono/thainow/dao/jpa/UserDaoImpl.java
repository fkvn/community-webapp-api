package mono.thainow.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mono.thainow.dao.UserDao;
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
	public User getUserById(long id) {
		return entityManager.find(User.class, id);
	}
	
	@Override
	public User getActiveUserById(long id) {
		User user = entityManager.createQuery("from User where status =: status and id =:id", User.class)
				.setParameter("status", UserStatus.ACTIVATED).setParameter("id", id).getSingleResult();

		return user;
	}

	@Override
	public User getActiveUserByUsername(String username) {
		User user = entityManager.createQuery("from User where status =: status and username =:username", User.class)
				.setParameter("status", UserStatus.ACTIVATED).setParameter("username", username).getSingleResult();

		return user;
	}

	@Override
	public User getActiveUserByEmail(String email) {
		try {
			User user = entityManager.createQuery("from User where status =:status and email =:email", User.class)
					.setParameter("status", UserStatus.ACTIVATED).setParameter("email", email).getSingleResult();
			return user;
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}

	@Override
	public User getActiveUserByPhone(String phone) {
		try {
			User user = entityManager.createQuery("from User where status =:status and phone =:phone", User.class)
					.setParameter("status", UserStatus.ACTIVATED).setParameter("phone", phone).getSingleResult();

			return user;
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}

	@Override
	public User getActiveUserBySub(String sub) {
		User user = entityManager.createQuery("from User where status =:status and sub =:sub", User.class).setParameter("sub", sub)
				.setParameter("status", UserStatus.ACTIVATED).getSingleResult();

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
			entityManager.createQuery("from User where status =:status and email =:email and email <> ''", User.class)
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
			entityManager.createQuery("from User where status =:status and phone =:phone and phone <> ''", User.class)
					.setParameter("status", UserStatus.ACTIVATED).setParameter("phone", phone).getSingleResult();

			return false;

		} catch (Exception ex) {
//			phone is available
			return true;
		}
	}



}
