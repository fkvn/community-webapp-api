package mono.thainow.dao;

import mono.thainow.domain.location.Location;

public interface LocationDao {
	
	Location getLocationById(Long id);
	
	Location getLocationByPlaceid(String placeid);
	
	Location getLocationByLatLng(String placeid, String lat, String lng);
	
	Location saveLocation(Location location);
	
	void removeLocation(Long id);
}
