package mono.thainow.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;
import mono.thainow.service.LocationService;

@Service
public class LocationServiceImpl implements LocationService {

	@Override
	public List<User> findUsersOfLocation(Location location) {
		// TODO Auto-generated method stub
		return null;
	}

}
