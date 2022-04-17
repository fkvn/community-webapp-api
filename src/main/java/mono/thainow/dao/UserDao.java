package mono.thainow.dao;

import mono.thainow.domain.user.User;

public interface UserDao {
	
	User getUser(long id);
	
	boolean isEmailUnique(String email);
	
	boolean isPhoneUnique(String phone);

	User saveUser(User user);

	void removeUser(long id);
}
