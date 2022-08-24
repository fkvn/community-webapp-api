package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.HousingDao;
import mono.thainow.domain.post.housing.Housing;

@Repository
public class HousingDaoImpl implements HousingDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Housing saveHousing(Housing housing) {
		return entityManager.merge(housing);
	}

}
