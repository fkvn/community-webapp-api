package mono.thainow.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.domain.user.User;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserServiceDashboardImpl userSDI;

	@Override
	public UserDetails loadUserByUsername(String query) throws UsernameNotFoundException {

		String loginValue = query.split(",")[1];
		String loginType = query.split(",")[0];

		Optional<User> user = null;

		switch (loginType) {
		case "email-login":
			user = Optional.ofNullable(userSDI.findByUserEmail(loginValue));
			break;
		case "phone-login":
			user = Optional.ofNullable(userSDI.findByUserPhone(loginValue));
			break;

		default:
		}

		Assert.isTrue(!user.isEmpty(), "User Not Found with username: " + loginValue);

		return UserDetailsImpl.build(user.get());
	}

}
