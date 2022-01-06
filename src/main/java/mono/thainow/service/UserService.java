package mono.thainow.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import mono.thainow.domain.user.User;

public interface UserService {
	
	List<User> getAllUsers();
	
	User getUserById(Long id);
	
	Page<User> findUserPaginated(int pageNo, int pageSize);
	
	Long createUser(User user);
	
	Long updatePartialUser(Long id, Map<String, Object> userInfo);
	
	void removeUser(Long id);
}
