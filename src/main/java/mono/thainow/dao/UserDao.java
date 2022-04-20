package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.user.User;

public interface UserDao {
	
	List<User> getAllUsers();
	
	List<User> getAllActiveUser();
	
	User getUser(long id);
	
	User getByUsername(String username);
	
	User getByUserEmail(String email);
	
	User getByUserPhone(String phone);
	
	User getByUserSub(String sub);
	
	boolean isEmailUnique(String email);
	
	boolean isPhoneUnique(String phone);

	User saveUser(User user);

	void removeUser(long id);
}
