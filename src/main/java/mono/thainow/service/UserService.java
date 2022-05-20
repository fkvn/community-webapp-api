package mono.thainow.service;

import java.util.List;
import java.util.Map;

import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.security.payload.request.SignUpRequest;

public interface UserService {
	
	List<User> getAllUsers();
	
	User getByUserId(Long id);
	User getActiveUserByUsername(String username);
	User getActiveUserByEmail(String email);
	User getActiveUserByPhone(String phone);
	User getActiveUserBySub(String sub);
	
	Long updatePartialUser(Long id, Map<String, Object> userInfo);
	
	User uploadProfilePicture(User user, StorageRequest storageRequest);
	
	User saveUser(User user);
	
	void deleteUser(Long id);
	
	void removeUser(Long id);
	
//	========= business requirement service =================
	
	String validateUserPhone(String phone);
	
	String validateUserEmail(String email);
	
	String validateAndEncodeUserPassword(String password);

	User initializeUserByRole(UserRole role);
	
	User getUserFromSignUpRequest(SignUpRequest signUpRequest);
	
	User addBusinessCompanyFromSignUpRequest(User user, SignUpRequest signUpRequest);
	
}
