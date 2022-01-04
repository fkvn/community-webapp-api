package mono.thainow.service.impl;

import java.lang.reflect.Field;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.google.i18n.phonenumbers.NumberParseException;

import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.UserRepository;
import mono.thainow.service.UserService;
import mono.thainow.util.PhoneValidationWithGoogleAPI;
import mono.thainow.util.util;
import survey.exception.UpdatingSurveyError;

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
				updatedUser.setPassword(util.hashPassword(key));
//				surveyInfo.get(key));
				break;
			case "email":
				updatedUser.setEmail(key);
				break;
			case "phone":
			{
				util.valPhoneNo(key);
				updatedUser.setPhone(key);
			}
				break;
			case "status":
				updatedUser.setStatus(key);
				break;
			default:
			}
		}

		return null;
	}

}
