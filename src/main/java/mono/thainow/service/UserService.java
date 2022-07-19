package mono.thainow.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.security.payload.request.SignupRequest;

public interface UserService {
	
	List<User> getAllUsers();
	
	User getByUserId(Long id);
	User getActiveUserByUsername(String username);
	User getActiveUserByEmail(String email);
	User getActiveUserByPhone(String phone);
	User getActiveUserBySub(String sub);
	
	Long updatePartialUser(Long id, Map<String, Object> userInfo);
	
	Storage uploadProfilePicture(User user, @RequestParam("file") MultipartFile file);
	
	User saveUser(User user);
	
	void deleteUser(Long id);
	
	void removeUser(Long id);
	
//	========= business requirement service =================
	
	String validateUsername(String username);
	
	String validateUserPhone(String phone);
	
	String validateUserEmail(String email);
	
	String validateAndEncodeUserPassword(String password);

	User initializeUserByRole(UserRole role);
	
	User getUserFromSignUpRequest(SignupRequest signUpRequest);
	
	User addBusinessCompanyFromSignUpRequest(User user, SignupRequest signUpRequest);
	
}
