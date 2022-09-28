package mono.thainow.service;

import java.util.List;

import com.google.maps.model.AddressComponent;
import com.google.maps.model.GeocodingResult;

import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;

public interface LocationService {

	List<User> findUsersOfLocation(Location location);
	
	Location createLocationByAddress(String address);
	
	Location fetchLocationByPlaceidAndAddress(String placeid, String address);
	
	Location fetchLocationFromGeocodingResult(GeocodingResult geoResult);
	
	Location fetchLocationFromAddressComponent(Location location, AddressComponent[] addressComponent);
}
