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
	public Location getLocationById(Long id) {
		return entityManager.find(Location.class, id);
	}
	
	@Override
	public Location getLocationByPlaceid(String placeid) {
		try {
			return entityManager
					.createQuery("from Location where placeid =:placeid", Location.class)
					.setParameter("placeid", placeid)
					.getSingleResult();
		} catch (Exception ex) {
//			if location is new 
			return null;
		}
	}

	@Override
	public Location getLocationByLatLng(String placeid, String lat, String lng) {
		try {
			return entityManager
					.createQuery("from Location where placeid =:placeid and lat =:lat and lng =:lng", Location.class)
					.setParameter("placeid", placeid).setParameter("lat", lat).setParameter("lng", lng)
					.getSingleResult();
		} catch (Exception ex) {
//			if location is new 
			return null;
		}
	}
	
	@Override
	public Location getLocationByFormattedAddress(String address) {
		
		try {
			return entityManager
					.createQuery("from Location where description =:address", Location.class)
					.setParameter("address", address)
					.getSingleResult();
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

	@Override
	public Location getLocationByEitherPlaceidOrAddress(String placeid, String address) {
		try {
			return entityManager
					.createQuery("from Location where placeid =:placeid or description =:address ", Location.class)
					.setParameter("placeid", placeid).setParameter("address", address)
					.getSingleResult();
		} catch (Exception ex) {
//			if location is new 
			return null;
		}
	}





}
