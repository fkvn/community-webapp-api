package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.DealDao;
import mono.thainow.domain.post.deal.Deal;

@Repository
public class DealDaoImpl implements DealDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Deal saveDeal(Deal deal) {
		return entityManager.merge(deal);
	}

}
