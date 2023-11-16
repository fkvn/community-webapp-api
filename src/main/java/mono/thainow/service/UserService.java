package mono.thainow.service;

import mono.thainow.domain.user.User;
import mono.thainow.rest.request.*;

public interface UserService {

//	List<User> getAllUsers();
    
    User findUserById (Long userId);
    
    User findActiveUserById (Long id);
    
    User findActiveUserByEmail (String email);
    
    User findActiveUserByPhone (String phone);
    
    User findActiveUserBySub (String sub);
    
    boolean isUsernameUnique (String username);
    
    boolean isEmailUnique (String email);
    
    boolean isPhoneUnique (String phone);
    
    String encodePassword (String password, boolean validate);
    
    User fetchUserFromUserRequest (User user, UserRequest signUpRequest);
    
    User fetchUserFromGoogleRequest (GoogleRequest request);
    
    User fetchUserFromAppleRequest (AppleRequest appleSignupRequest);
    
    User saveUser (User user);
    
    User fetchUserFromFacebookRequest (FacebookRequest facebookSignupRequest);
    
    User fetchUserFromLineRequest (LineRequest request);
    
    void remove (User account);

//	User fetchUserFromUpdateRequest(User user, UserRequest userUpdateInfoRequest);
    
    void activateUserById (Long userId);
    
    User activateUser (User user);
    
    
    Boolean isPhoneExisting (String phone);
    
    Boolean isEmailExisting (String email);
}
