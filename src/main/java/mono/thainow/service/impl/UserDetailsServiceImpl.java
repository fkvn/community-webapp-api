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
	private UserServiceImpl userSDI;

//	this function is called when Sign-in and Validate token
//	this is called automatically because UserDetailsService interface that has only one method
	@Override
	public UserDetails loadUserByUsername(String query) throws UsernameNotFoundException {

		String[] splitQuery = query.split(",");
		Optional<User> user = null;	
		
//		sign-in case
		if (splitQuery.length == 2) {
			String loginValue = query.split(",")[1];
			String loginType = query.split(",")[0];

			switch (loginType) {
			case "email-login":
				user = Optional.ofNullable(userSDI.getActiveUserByEmail(loginValue));
				break;
			case "phone-login":
				user = Optional.ofNullable(userSDI.getActiveUserByPhone(loginValue));
				break;

			default:
			}
			
			Assert.isTrue(user != null, "User Not Found with credential: " + loginValue);
		}
//		validate token - this case the query is the sub value
		else if (splitQuery.length == 1) {
			
			String sub = splitQuery[0];
			
			user = Optional.ofNullable(userSDI.getActiveUserBySub(sub));
			
			Assert.isTrue(!user.isEmpty(), "Error: Unauthorized!");
		}
		
		return UserDetailsImpl.build(user.get());
	}

}
