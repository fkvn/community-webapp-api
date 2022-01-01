package mono.thainow.service.impl;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.google.i18n.phonenumbers.NumberParseException;

import mono.thainow.dao.UserDao;
import mono.thainow.domain.user.User;
import mono.thainow.repository.UserRepository;
import mono.thainow.service.UserService;
import mono.thainow.util.PhoneValidationWithGoogleAPI;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

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
			boolean isPhoneValid = false;
			String[] arrPhones = { phone.get() };
			try {
				isPhoneValid = new PhoneValidationWithGoogleAPI().validatePhoneNumber(arrPhones, "US");
			} catch (NumberParseException e) {
				// TODO Auto-generated catch block
			}

			Assert.isTrue(isPhoneValid, "Allow US phone number is allowed!");
		}

		Optional<String> password = Optional.ofNullable(user.getPassword());
		String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\\\S+$).{8, 20}$";

		Assert.isTrue(!password.isEmpty() && password.get().matches(passwordRegex),
				"Your password must be between 8 and 20 characters (at least 1 upper, 1 lower, 1 number, and no white space)");

		String hashedPwd = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(12));
		user.setPassword(hashedPwd);

		user = userDao.saveUser(user);

		return user.getId();
	}

}
