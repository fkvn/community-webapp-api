package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.UserDao;
import mono.thainow.domain.user.User;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public User getUser(long id) {
		return entityManager.find(User.class, id);
	}

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
