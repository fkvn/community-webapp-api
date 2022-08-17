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
		return entityManager.createQuery("from User where status =: status and id =:id", User.class)
				.setParameter("status", UserStatus.ACTIVATED).setParameter("id", id).getSingleResult();
	}

	@Override
	public User getActiveUserByUsername(String username) {
		return entityManager.createQuery("from User where status =: status and username =:username", User.class)
				.setParameter("status", UserStatus.ACTIVATED).setParameter("username", username).getSingleResult();

	}

	@Override
	public User getActiveUserByEmail(String email) {
		return entityManager.createQuery("from User where status =:status and email =:email", User.class)
				.setParameter("status", UserStatus.ACTIVATED).setParameter("email", email).getSingleResult();
	}

	@Override
	public User getActiveUserByPhone(String phone) {
		return entityManager.createQuery("from User where status =:status and phone =:phone", User.class)
				.setParameter("status", UserStatus.ACTIVATED).setParameter("phone", phone).getSingleResult();
	}

	@Override
	public User getActiveUserBySub(String sub) {
		return entityManager.createQuery("from User where status =:status and sub =:sub", User.class)
				.setParameter("status", UserStatus.ACTIVATED).setParameter("sub", sub).getSingleResult();
	}

//	=====================================================

	@Override
	public boolean isEmailUnique(String email) {
		List<User> users = entityManager
				.createQuery("from User where status <> :statusDelete and email =:email and email <> ''", User.class)
				.setParameter("statusDelete", UserStatus.DELETED).setParameter("email", email).getResultList();

		if (users.size() == 0) {
			return true;
		}

		return false;
	}

	@Override
	public boolean isPhoneUnique(String phone) {
		List<User> users = entityManager
				.createQuery("from User where status <> :statusDelete and phone =:phone and phone <> ''", User.class)
				.setParameter("statusDelete", UserStatus.DELETED).setParameter("phone", phone).getResultList();

		if (users.size() == 0) {
			return true;
		}

		return false;
	}

	@Override
	public boolean isUsernameUnique(String username) {
		List<User> users = entityManager
				.createQuery("from User where status <> :statusDelete and username =:username and username <> ''",
						User.class)
				.setParameter("statusDelete", UserStatus.DELETED).setParameter("username", username).getResultList();

		if (users.size() == 0) {
			return true;
		}

		return false;
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

}
