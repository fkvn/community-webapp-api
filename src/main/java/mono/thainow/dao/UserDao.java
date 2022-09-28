package mono.thainow.dao;

import mono.thainow.domain.user.User;

public interface UserDao {

//	List<User> getAllUsers();

//	List<User> getAllActiveUser();

//	User findUserById(long id);

	User findActiveUserById(long id);

	User findActiveUserByUsername(String username);

	User findActiveUserByEmail(String email);

	User findActiveUserByPhone(String phone);

	User findActiveUserBySub(String sub);

	boolean isUsernameUnique(String username);

	boolean isEmailUnique(String email);

	boolean isPhoneUnique(String phone);

	User saveUser(User user);

//	void removeUser(long id);
}
