package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.user.User;
import mono.thainow.rest.request.AppleSignupRequest;
import mono.thainow.rest.request.FacebookSignupRequest;
import mono.thainow.rest.request.GoogleSignupRequest;
import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.rest.request.UserUpdateInfoRequest;

public interface UserService {

	List<User> getAllUsers();

	User getByUserId(Long id);

	User getActiveUserByEmail(String email);

	User getActiveUserByPhone(String phone);

	User getActiveUserBySub(String sub);

	boolean isUsernameUnique(String username);

	boolean isEmailUnique(String email);

	boolean isPhoneUnique(String phone);

	String encodePassword(String password, boolean validate);

	User getUserFromSignupRequest(UserSignupRequest signUpRequest);

	User getUserFromGoogleSignupRequest(GoogleSignupRequest googleSignupRequest);
	
	User getUserFromAppleSignupRequest(AppleSignupRequest appleSignupRequest);

	User saveUser(User user);

	User getUserFromFacebookSignupRequest(FacebookSignupRequest facebookSignupRequest);

	void remove(User account);

	User getUserFromUpdateInfoRequest(User user, UserUpdateInfoRequest userUpdateInfoRequest);

	

}
