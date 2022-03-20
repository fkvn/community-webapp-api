package mono.thainow.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import mono.thainow.domain.user.User;

public interface UserService {
	
	List<User> getAllUsers();
	
	String getAllUsers(String token);
	
	User getUserById(Long id);
	
	User findByUsername(String username);
	User findByUserEmail(String email);
	User findByUserPhone(String phone);
	
	Page<User> findUserPaginated(int pageNo, int pageSize);
	
	User saveUser(User user);
	
	Long createUser(String token, User user, User admin);
	
	Long updatePartialUser(Long id, Map<String, Object> userInfo);
	
	void removeUser(Long id);
}
