package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.MarketplaceDao;
import mono.thainow.domain.post.marketplace.Marketplace;

@Repository
public class MarketplaceDaoImpl implements MarketplaceDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Marketplace saveMarketplace(Marketplace marketplace) {
		return entityManager.merge(marketplace);
	}

}
