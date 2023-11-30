package mono.thainow.service;

import mono.thainow.domain.user.User;
import mono.thainow.rest.request.*;

import java.util.Optional;

public interface UserService {

    Optional<User> findUserById(Long id);

    Optional<User> findUserByEmail(String email);

    Optional<User> findUserByPhone(String phone, String region);

    Optional<User> findUserBySub(String sub);

    //	=============================================================

    Optional<User> findActiveUserById(Long id);

    Optional<User> findActiveUserByEmail(String email);

    Optional<User> findActiveUserByPhone(String phone, String region);

    Optional<User> findActiveUserBySub(String sub);

    //	=============================================================

    void activateUserById(Long userId);

    User fetchUserFromUserRequest(User user, UserRequest signUpRequest);

    User fetchNewUserFromAccessByGoogleRequest(AccessByGoogleRequest request);

    User fetchNewUserFromAccessByAppleRequest(AccessByAppleRequest appleSignupRequest);


    User fetchNewUserFromAccessByFacebookRequest(AccessByFacebookRequest facebookSignupRequest);

    User fetchNewUserFromAccessByLineRequest(AccessByLineRequest request);

    //	=============================================================
    User saveUser(User user);

    void remove(User account);

    void changePassword(Long userId, String password);
}
