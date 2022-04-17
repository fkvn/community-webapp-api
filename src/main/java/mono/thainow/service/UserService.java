package mono.thainow.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;

import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.security.payload.request.SignupRequest;

public interface UserService {
	
	List<User> getAllUsers();
	
	User getByUserId(Long id);
	User getByUsername(String username);
	User getByUserEmail(String email);
	User getByUserPhone(String phone);
	User getByUserSub(String sub);
	
	Page<User> getUserPaginated(int pageNo, int pageSize);
	
	Long updatePartialUser(Long id, Map<String, Object> userInfo);
	
	User saveUser(User user);
	
	void deleteUser(Long id);
	
	void removeUser(Long id);
	
//	========= business requirement service =================
	
	User saveUserFromSignUpInfo(User user, SignupRequest signUpRequest);
	
	User initializeUserByRole(UserRole role);
	
	User updateBusinessUserFromSignUpInfo(User user, SignupRequest signUpRequest);
	
}
