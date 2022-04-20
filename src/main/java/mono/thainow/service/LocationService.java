package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;
import mono.thainow.security.payload.request.SignUpRequest;

public interface LocationService {

	List<User> findUsersOfLocation(Location location);
	
	Location validateIfLocationExist(Location location);
	
	Location getLocationFromSignUpRequest(SignUpRequest signUpRequest);
}
