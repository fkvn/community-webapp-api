package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.user.User;
import mono.thainow.rest.request.AppleRequest;
import mono.thainow.rest.request.FacebookRequest;
import mono.thainow.rest.request.GoogleRequest;
import mono.thainow.rest.request.UserRequest;

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

	User getUserFromSignupRequest(UserRequest signUpRequest);

	User getUserFromGoogleRequest(GoogleRequest request);
	
	User getUserFromAppleRequest(AppleRequest appleSignupRequest);

	User saveUser(User user);

	User getUserFromFacebookSignupRequest(FacebookRequest facebookSignupRequest);

	void remove(User account);

	User getUserFromUpdateRequest(User user, UserRequest userUpdateInfoRequest);

	

}
