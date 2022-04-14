package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.LocationDao;
import mono.thainow.domain.location.Location;

@Repository
public class LocationDaoImpl implements LocationDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Location findLocationById(Long id) {
		return entityManager.find(Location.class, id);
	}

	@Override
	public Location findLocationByLatLng(String lat, String lng) {
		try {
			return entityManager.createQuery("from Location where lat =:lat and lng =:lng", Location.class)
					.setParameter("lat", lat).setParameter("lng", lng).getSingleResult();
		} catch (Exception ex) {
//			if location is new 
			return null;
		}
	}

	@Override
	@Transactional
	public Location saveLocation(Location location) {
		return entityManager.merge(location);
	}

	@Override
	@Transactional
	public void removeLocation(Long id) {
		Location location = entityManager.find(Location.class, id);
		entityManager.remove(location);
	}

}
