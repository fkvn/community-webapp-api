package mono.thainow.service.impl;

import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserProvider;
import mono.thainow.rest.request.*;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.rest.response.TokenResponse;
import mono.thainow.security.jwt.JwtUtils;
import mono.thainow.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.validation.Valid;
import java.util.Optional;

@Service public class AuthServiceImpl implements AuthService {
    
    @Autowired
    AuthenticationManager authenticationManager;
    @Autowired
    JwtUtils jwtUtils;
    @Autowired
    TwilioService twilioService;
    @Autowired
    StorageService storageService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProfileService profileService;

//	======================================================================
    
    @Override
    public void sendVerificationToken (TokenRequest tokenRequest) {

//		inputs
        String phone = Optional.ofNullable(tokenRequest.getPhone()).orElse("")
                .trim();
        String region = Optional.ofNullable(tokenRequest.getRegion()).orElse("")
                .trim();
        String email = Optional.ofNullable(tokenRequest.getEmail()).orElse("")
                .trim();
        String channel = Optional.ofNullable(tokenRequest.getChannel())
                .orElse("").trim();

//		send verification token
        twilioService.sendVerficationToken(phone, region, email, channel);
    }
    
    @Override
    public void checkVerificationToken (TokenResponse tokenResponse) {

//		inputs
        String phone = Optional.ofNullable(tokenResponse.getPhone()).orElse("")
                .trim();
        String region = Optional.ofNullable(tokenResponse.getRegion())
                .orElse("US").trim();
        String email = Optional.ofNullable(tokenResponse.getEmail()).orElse("")
                .trim();
        String channel = Optional.ofNullable(tokenResponse.getChannel())
                .orElse("").trim();
        String token = Optional.ofNullable(tokenResponse.getToken()).orElse("")
                .trim();

//		check verification token
        twilioService.checkVerficationToken(phone, region, email, channel,
                token);
    }
    
    @Override
    public Long registerWithThaiNow (UserRequest request) {

//		check Type of verification
        Boolean isVerified = Optional.ofNullable(request.getIsVerified())
                .orElse(false);

//		verification is required for users
        Assert.isTrue(isVerified, "Users must be verified to register!");

//		retrieve user information
        User user = userService.fetchUserFromUserRequest(null, request);

//		persist user info into database 
        user = userService.saveUser(user);

//		create a account profile with new user
        Profile userProfile = profileService.createUserProfile(user);
        
        return userProfile.getId();
    }
    
    @Override
    public JwtResponse signinWithThaiNow (UserRequest request) {
        
        String channel = Optional.ofNullable(request.getChannel()).orElse("");

//		only verify by email and phone
        Assert.isTrue(channel.equals("email") || channel.equals("phone"),
                "Only Email and Phone are supported at the moment!");

//		password verification
        String password = Optional.ofNullable(request.getPassword()).orElse("")
                .trim();
        
        String username = "";
        
        switch (channel) {
            
            case "email": {
                
                String email = Optional.ofNullable(request.getEmail())
                        .orElse("").trim();

//			email is required
                Assert.isTrue(!email.isEmpty(), "Email is required!");
                
                User user = userService.findActiveUserByEmail(email);
                Assert.isTrue(user.getProvider().equals(UserProvider.THAINOW),
                        String.format("The email linked with your %s account!",
                                user.getProvider()));

//			update username
                username = "email-login," + email;
                
            }
            break;
            
            case "phone": {
                
                String phone = Optional.ofNullable(request.getPhone())
                        .orElse("").trim();

//			phone number is required
                Assert.isTrue(!phone.isEmpty(), "Phone number is required!");
                
                User user = userService.findActiveUserByPhone(phone);
                Assert.isTrue(user.getProvider().equals(UserProvider.THAINOW),
                        String.format("The email linked with your %s account!",
                                user.getProvider()));


//			update username
                username = "phone-login," + phone;
                
            }
            break;
            
            default:
                break;
        }
        
        return signedJWTAuth(username, password);
        
    }
    
    @Override
    public JwtResponse accessWithGoogle (GoogleRequest request) {
        
        String email = Optional.ofNullable(request.getEmail()).orElse("")
                .trim();

//		email is unique -> new user -> sign up
        if (userService.isEmailUnique(email)) {
            User user = userService.fetchUserFromGoogleRequest(request);

//			persist user
            user = userService.saveUser(user);

//			create a account profile with new user
            profileService.createUserProfile(user);
        } else {
            User user = userService.findActiveUserByEmail(email);
            Assert.isTrue(user.getProvider().equals(UserProvider.GOOGLE),
                    String.format("The email linked with your %s account!",
                            user.getProvider()));

//			this is to keep posted with password change from GOOGLE account
            String password = Optional.ofNullable(request.getSub()).orElse("")
                    .trim();
            user.setPassword(userService.encodePassword(password, false));
            userService.saveUser(user);
        }
        
        String username = "email-login," + email;
        String password = Optional.ofNullable(request.getSub()).orElse("")
                .trim();
        
        return signedJWTAuth(username, password);
    }
    
    @Override
    public JwtResponse accessWithApple (AppleRequest request) {
        
        String email = Optional.ofNullable(request.getEmail()).orElse("")
                .trim();

//		email is unique -> new user -> sign up
        if (userService.isEmailUnique(email)) {
            User user = userService.fetchUserFromAppleRequest(request);

//			persit user
            user = userService.saveUser(user);

//			create a account profile with new user
            profileService.createUserProfile(user);
        } else {
            User user = userService.findActiveUserByEmail(email);
            Assert.isTrue(user.getProvider().equals(UserProvider.APPLE),
                    String.format("The email linked with your %s account!",
                            user.getProvider()));

//			this is to keep posted with password change from APPLE account
            String password = Optional.of(request.getSub()).orElse("").trim();
            user.setPassword(userService.encodePassword(password, false));
            userService.saveUser(user);
        }
        
        String username = "email-login," + email;
        String password = Optional.ofNullable(request.getSub()).orElse("")
                .trim();
        
        return signedJWTAuth(username, password);
    }
    
    @Override
    public JwtResponse accessWithFacebook (FacebookRequest request) {
        
        String email = Optional.ofNullable(request.getEmail()).orElse("")
                .trim();

//		email is unique -> new user -> sign up
        if (userService.isEmailUnique(email)) {
            User user = userService.fetchUserFromFacebookRequest(request);

//			persit user
            user = userService.saveUser(user);

//			create a account profile with new user
            profileService.createUserProfile(user);
        } else {
            User user = userService.findActiveUserByEmail(email);
            Assert.isTrue(user.getProvider().equals(UserProvider.FACEBOOK),
                    String.format("The email linked with your %s account!",
                            user.getProvider()));

//			this is to keep posted with password change from FACEBOOK account
            String password = Optional.of(request.getId()).orElse("").trim();
            user.setPassword(userService.encodePassword(password, false));
            userService.saveUser(user);
        }
        
        String username = "email-login," + email;
        String password = Optional.ofNullable(request.getId()).orElse("")
                .trim();
        
        return signedJWTAuth(username, password);
    }
    
    @Override
    public JwtResponse accessWithLine (LineRequest request) {
        String email = Optional.ofNullable(request.getEmail()).orElse("")
                .trim();

//		email is unique -> new user -> sign up
        if (userService.isEmailUnique(email)) {
            User user = userService.fetchUserFromLineRequest(request);

//			persit user
            user = userService.saveUser(user);

//			create a account profile with new user
            profileService.createUserProfile(user);
        } else {
            User user = userService.findActiveUserByEmail(email);
            Assert.isTrue(user.getProvider().equals(UserProvider.LINE),
                    String.format("The email %s linked with your %s account!",
                            user.getEmail(), user.getProvider()));

//			this is to keep posted with password change from GOOGLE account
            String password = Optional.ofNullable(request.getSub()).orElse("")
                    .trim();
            user.setPassword(userService.encodePassword(password, false));
            userService.saveUser(user);
        }
        
        String username = "email-login," + email;
        String password = Optional.ofNullable(request.getSub()).orElse("")
                .trim();
        
        return signedJWTAuth(username, password);
    }
    
    @Override
    public JwtResponse signedJWTAuth (String username, String password) {
        
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password));
        
        SecurityContextHolder.getContext().setAuthentication(authentication);
        
        String jwt = jwtUtils.generateJwtToken(authentication);
        
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        
        User account = userService.findActiveUserById(userDetails.getId());
        UserProfile profile = profileService.findUserProfileByAccount(account);
        
        JwtResponse jwtClaims = new JwtResponse(jwt, userDetails);
        jwtClaims.setProfile(profile);

//		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
//				.collect(Collectors.toList());
        
        return jwtClaims;
    }
    
    @Override
    public void changePassword (@Valid ChangePasswordRequest request) {
        
        String channel = Optional.ofNullable(request.getChannel()).orElse("");

//		only verify by email and phone
        Assert.isTrue(channel.equals("email") || channel.equals("phone"),
                "Only Email and Phone are supported at the moment!");

//		password verification
        String password = Optional.ofNullable(request.getPassword()).orElse("")
                .trim();
        
        User user = null;
        
        switch (channel) {
            
            case "email": {
                
                String email = Optional.ofNullable(request.getEmail())
                        .orElse("").trim();

//			email is required
                Assert.isTrue(!email.isEmpty(), "Email is required!");
                user = userService.findActiveUserByEmail(email);
            }
            break;
            
            case "phone": {
                
                String phone = Optional.ofNullable(request.getPhone())
                        .orElse("").trim();

//			phone number is required
                Assert.isTrue(!phone.isEmpty(), "Phone number is required!");
                user = userService.findActiveUserByPhone(phone);
            }
            break;
            default:
                break;
        }
        
        Assert.isTrue(user.getProvider().equals(UserProvider.THAINOW),
                String.format(
                        "Update Error! This profile is managed by %s account.",
                        user.getProvider()));
        user.setPassword(userService.encodePassword(password, true));
        
        userService.saveUser(user);
        
    }
    
}
