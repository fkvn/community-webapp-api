package mono.thainow.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.UserRepository;
import mono.thainow.service.UserService;
import mono.thainow.util.util;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public Page<User> findUserPaginated(int pageNo, int pageSize) {
		Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
		return userRepository.findAll(pageable);
	}
	
	@Override
	public User getUserById(Long id) {
		return userRepository.getById(id);
	}

	@Override
	public Long createUser(User user) {

		Optional<String> email = Optional.ofNullable(user.getEmail());
		Optional<String> phone = Optional.ofNullable(user.getPhone());

		Assert.isTrue(!email.isEmpty() || !phone.isEmpty(),
				"User needs at least either email or phone number to register!");

		if (!phone.isEmpty()) {
			util.valPhoneNo(phone.get());
		}

		Optional<String> password = Optional.ofNullable(user.getPassword());
		String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,20}$";

		Assert.isTrue(!password.isEmpty() && password.get().matches(passwordRegex),
				"Your password must be between 8 and 20 characters (at least 1 upper, 1 lower, 1 number, and no white space)");

		String hashedPwd = util.hashPassword(password.toString());
		user.setPassword(hashedPwd);

		// set user status
		user.setStatus(UserStatus.ACTIVE);

		user = userRepository.save(user);

		return user.getId();
	}

	@Override
	public void removeUser(Long id) {
		User user = userRepository.getById(id);
		user.setStatus(UserStatus.DELETED);
		userRepository.save(user);
	}

	@Override
	public Long updatePartialUser(Long id, Map<String, Object> userInfo) {

		User updatedUser = userRepository.getById(id);

		for (String key : userInfo.keySet()) {
			switch (key) {
			case "password":
				updatedUser.setPassword(util.hashPassword((String) userInfo.get(key)));
				break;
			case "email":
				updatedUser.setEmail((String) userInfo.get(key));
				break;
			case "phone": {
				util.valPhoneNo(String.valueOf(userInfo.get(key)));
				updatedUser.setPhone(String.valueOf(userInfo.get(key)));
			}
				break;
			case "status":
				updatedUser.setStatus(UserStatus.valueOf((String) userInfo.get(key)));
				break;
			default:
			}
		}

		updatedUser = userRepository.save(updatedUser);

		return updatedUser.getId();
	}



}
