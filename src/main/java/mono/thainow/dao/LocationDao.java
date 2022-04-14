package mono.thainow.dao;

import mono.thainow.domain.location.Location;

public interface LocationDao {
	
	Location findLocationById(Long id);
	
	Location findLocationByLatLng(String lat, String lng);
	
	Location saveLocation(Location location);
	
	void removeLocation(Long id);
}
