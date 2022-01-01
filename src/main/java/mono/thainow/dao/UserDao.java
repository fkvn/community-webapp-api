package mono.thainow.dao;

import mono.thainow.domain.user.User;

public interface UserDao {
	
	public User getUser(long id);

	public User saveUser(User user);

	public void removeUser(long id);
}
