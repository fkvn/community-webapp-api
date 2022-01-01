package mono.thainow.service;

import java.util.List;

import org.springframework.data.domain.Page;

import mono.thainow.domain.user.User;

public interface UserService {
	
	List<User> getAllUsers();
	
	Page<User> findUserPaginated(int pageNo, int pageSize);
	
	Long createUser(User user);
}
