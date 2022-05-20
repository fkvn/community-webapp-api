package mono.thainow.service;

import java.util.List;

import com.google.maps.model.AddressComponent;
import com.google.maps.model.GeocodingResult;

import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.security.payload.request.SignUpRequest;

public interface LocationService {

	List<User> findUsersOfLocation(Location location);
	
	Location createLocationByAddress(String address);
	
	Location getLocationFromSignUpRequest(SignUpRequest signUpRequest);

	Location getLocationFromPostRequest(PostRequest postRequest);
	
	Location getLocationFromGeocodingResult(GeocodingResult geoResult);
	
	Location updateLocationFromAddressComponent(Location location, AddressComponent[] addressComponent);
}
