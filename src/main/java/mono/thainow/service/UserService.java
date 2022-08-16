package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.user.User;
import mono.thainow.rest.request.GoogleAuthRequest;
import mono.thainow.rest.request.UserSignupRequest;

public interface UserService {

	List<User> getAllUsers();

	User getByUserId(Long id);

	User getActiveUserByEmail(String email);

	User getActiveUserByPhone(String phone);

	User getActiveUserBySub(String sub);

	boolean isUsernameUnique(String username);

	boolean isEmailUnique(String email);

	boolean isPhoneUnique(String phone);

	String encodePassword(String password);

	User getUserFromSignupRequest(UserSignupRequest signUpRequest);

	User updateUserFromGoogleAuthRequest(User user, GoogleAuthRequest googleAuthRequest);

	User saveUser(User user);

}
