package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.profile.Profile;

@Repository
public class ProfileDaoImpl implements ProfileDao {

	@PersistenceContext
	private EntityManager entityManager;

//	=============================================

	@Override
	@Transactional
	public Profile saveProfile(Profile profile) {
		return entityManager.merge(profile);
	}


}
