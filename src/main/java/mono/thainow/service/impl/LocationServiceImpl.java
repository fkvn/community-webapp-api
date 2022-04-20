package mono.thainow.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.LocationDao;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;
import mono.thainow.security.payload.request.SignUpRequest;
import mono.thainow.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService {

	
	@Autowired
	LocationDao locationDao;
	
	@Override
	public List<User> findUsersOfLocation(Location location) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Location validateIfLocationExist(Location location) {
		
//		check if location is in the database
		Location dbLocation = locationDao.getLocationByLatLng(location.getPlaceid(), location.getLat(),
				location.getLng());

//		new location
		if (dbLocation == null) {
//			save location to database to persist
			location = locationDao.saveLocation(location);
		}
		else {
			location = dbLocation;
		}
		
		return location;
	}

	@Override
	public Location getLocationFromSignUpRequest(SignUpRequest signUpRequest) {
		
//		get location
		Location location = Optional.ofNullable(signUpRequest.getLocation()).orElse(new Location());

//		validate location
		location = validateIfLocationExist(location);
		
		return location;
	}

}
