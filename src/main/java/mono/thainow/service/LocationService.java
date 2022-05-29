package mono.thainow.service;

import java.util.List;

import com.google.maps.model.AddressComponent;
import com.google.maps.model.GeocodingResult;

import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;
import mono.thainow.rest.request.PostRequest;

public interface LocationService {

	List<User> findUsersOfLocation(Location location);
	
	Location createLocationByAddress(String address);
	
	Location getLocationFromPlaceidAndAddress(String placeid, String address);

	Location getLocationFromPostRequest(PostRequest postRequest);
	
	Location getLocationFromGeocodingResult(GeocodingResult geoResult);
	
	Location updateLocationFromAddressComponent(Location location, AddressComponent[] addressComponent);
}
