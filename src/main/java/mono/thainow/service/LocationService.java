package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;

public interface LocationService {

	List<User> findUsersOfLocation(Location location);
}
