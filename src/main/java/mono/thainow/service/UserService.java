package mono.thainow.service;

import mono.thainow.domain.user.User;
import mono.thainow.rest.request.AppleRequest;
import mono.thainow.rest.request.FacebookRequest;
import mono.thainow.rest.request.GoogleRequest;
import mono.thainow.rest.request.UserRequest;

public interface UserService {

//	List<User> getAllUsers();
	
	User findUserById(Long userId);
	
	User findActiveUserById(Long id);

	User findActiveUserByEmail(String email);

	User findActiveUserByPhone(String phone);

	User findActiveUserBySub(String sub);

	boolean isUsernameUnique(String username);

	boolean isEmailUnique(String email);

	boolean isPhoneUnique(String phone);

	String encodePassword(String password, boolean validate);

	User fetchUserFromUserRequest(User user, UserRequest signUpRequest);

	User fetchUserFromGoogleRequest(GoogleRequest request);
	
	User fetchUserFromAppleRequest(AppleRequest appleSignupRequest);

	User saveUser(User user);

	User fetchUserFromFacebookRequest(FacebookRequest facebookSignupRequest);

	void remove(User account);

//	User fetchUserFromUpdateRequest(User user, UserRequest userUpdateInfoRequest);

	User activateUserById(Long userId);

	User activateUser(User user);



	

}
