package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.user.User;

public interface UserDao {
	
	List<User> getAllUsers();
	
	List<User> getAllActiveUser();
	
	User getUserById(long id);
	
	User getActiveUserById(long id);
	
	User getActiveUserByUsername(String username);
	
	User getActiveUserByEmail(String email);
	
	User getActiveUserByPhone(String phone);
	
	User getActiveUserBySub(String sub);
	
	boolean isEmailUnique(String email);
	
	boolean isPhoneUnique(String phone);

	User saveUser(User user);

	void removeUser(long id);
}
