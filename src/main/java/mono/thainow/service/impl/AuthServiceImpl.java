package mono.thainow.service.impl;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserProvider;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.exception.BadRequest;
import mono.thainow.rest.request.*;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.security.jwt.JwtUtils;
import mono.thainow.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.Optional;

import static org.apache.commons.lang3.StringUtils.isBlank;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private TwilioService twilioService;

    @Autowired
    private UserService userService;

    @Autowired
    private EmailService emailService;

    @Autowired
    private ProfileService profileService;

    @Autowired
    private PasswordService passwordService;

    //	======================================================================

    @Override
    public void sendVerificationToken(SendTokenRequest request) {
        twilioService.sendVerificationToken(request);
    }

    @Override
    public void checkVerificationToken(VerifyTokenRequest request) {
        twilioService.checkVerificationToken(request);
    }

    @Override
    public Long signupWithThaiNowByEmail(SignupByEmailRequest request) {

        String email = request.getEmail();
        String password = request.getPassword();
        String firstname = request.getFirstname();
        String lastname = request.getLastname();

        Optional<User> existedUser = userService.findUserByEmail(email);
        if (existedUser.isPresent()) {
            throw new BadRequest("This account exists in the system!");
        }

        User user = new User();
        user.setEmail(emailService.validateEmail(email));
        user.setPassword(
                passwordService.encodePassword(passwordService.validatePassword(password)));
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setUsername(email);
        user.setProvider(UserProvider.THAINOW);
        user.setRole(UserRole.CLASSIC);
        user.setStatus(UserStatus.ACTIVATED);

        //		merge user
        user = userService.saveUser(user);

        //		create an account profile with new user
        Profile userProfile = profileService.createUserProfile(user);

        return userProfile.getId();
    }

    @Override
    public JwtResponse signingWithThaiNowByEmail(SigningByEmailRequest request) {

        String email = request.getEmail();
        if (isBlank(email)) throw new BadRequest("Invalid Email!");

        String password = request.getPassword();
        if (isBlank(password)) throw new BadRequest("Invalid Password!");

        User user = userService.findActiveUserByEmail(email).get();
        if (!user.getProvider().equals(UserProvider.THAINOW)) throw new BadRequest(
                String.format("The email linked with your %s account!", user.getProvider()));

        //		username uses to log in
        String username = "email-login," + email.trim();

        JwtResponse res = signedJWTAuth(username, password);

        return res;

    }

    @Override
    public JwtResponse signingWithThaiNowByPhone(SigningByPhoneRequest request) {

        String phone = request.getPhone();
        String region = request.getRegion();
        Assert.isTrue(isBlank(phone) && isBlank(region), "Invalid Phone!");

        String password = request.getPassword();
        Assert.isTrue(isBlank(password), "Invalid Password!");

        User user = userService.findActiveUserByPhone(phone, region).get();
        Assert.isTrue(user.getProvider().equals(UserProvider.THAINOW),
                String.format("The email linked with your %s account!", user.getProvider()));

        //		username uses to log in
        String username = "phone-login," + phone + "," + region;

        return signedJWTAuth(username, password);
    }

    @Override
    public JwtResponse accessWithGoogle(AccessByGoogleRequest request) {

        String email = Optional.ofNullable(request.getEmail()).orElse("").trim();
        Assert.isTrue(!email.isEmpty(), "Email can't be empty!");

        //		email not exist -> new user -> sign up
        if (!emailService.isEmailExisting(email)) {
            User user = userService.fetchNewUserFromAccessByGoogleRequest(request);

            //			merge user
            user = userService.saveUser(user);

            //			create an account profile with new user
            profileService.createUserProfile(user);
        } else {
            User user = userService.findActiveUserByEmail(email).get();
            Assert.isTrue(user.getProvider().equals(UserProvider.GOOGLE),
                    String.format("The email linked with your %s account!", user.getProvider()));

            //			this is to keep posted with password change from GOOGLE account
            String password = request.getSub();
            user.setPassword(passwordService.encodePassword(password));

            //          merge user
            userService.saveUser(user);
        }

        String username = "email-login," + email;
        String password = Optional.ofNullable(request.getSub()).orElse("").trim();

        return signedJWTAuth(username, password);
    }

    @Override
    public JwtResponse accessWithApple(AccessByAppleRequest request) {

        String email = Optional.ofNullable(request.getEmail()).orElse("").trim();
        Assert.isTrue(!email.isEmpty(), "Email can't be empty!");

        //		email not exist -> new user -> sign up
        if (!emailService.isEmailExisting(email)) {
            User user = userService.fetchNewUserFromAccessByAppleRequest(request);

            //			merge user
            user = userService.saveUser(user);

            //			create an account profile with new user
            profileService.createUserProfile(user);
        } else {
            User user = userService.findActiveUserByEmail(email).get();
            Assert.isTrue(user.getProvider().equals(UserProvider.APPLE),
                    String.format("The email linked with your %s account!", user.getProvider()));

            //			this is to keep posted with password change from APPLE account
            String password = request.getSub();
            user.setPassword(passwordService.encodePassword(password));

            //            merge user
            userService.saveUser(user);
        }

        String username = "email-login," + email;
        String password = Optional.ofNullable(request.getSub()).orElse("").trim();

        return signedJWTAuth(username, password);
    }

    @Override
    public JwtResponse accessWithFacebook(AccessByFacebookRequest request) {

        String email = Optional.ofNullable(request.getEmail()).orElse("").trim();
        Assert.isTrue(!email.isEmpty(), "Email can't be empty!");

        //		email not exist -> new user -> sign up
        if (!emailService.isEmailExisting(email)) {
            User user = userService.fetchNewUserFromAccessByFacebookRequest(request);

            //			merge user
            user = userService.saveUser(user);

            //			create an account profile with new user
            profileService.createUserProfile(user);
        } else {
            User user = userService.findActiveUserByEmail(email).get();
            Assert.isTrue(user.getProvider().equals(UserProvider.FACEBOOK),
                    String.format("The email linked with your %s account!", user.getProvider()));

            //			this is to keep posted with password change from FACEBOOK account
            String password = request.getId();
            user.setPassword(passwordService.encodePassword(password));

            //            merge user
            userService.saveUser(user);
        }

        String username = "email-login," + email;
        String password = Optional.ofNullable(request.getId()).orElse("").trim();

        return signedJWTAuth(username, password);
    }

    @Override
    public JwtResponse accessWithLine(AccessByLineRequest request) {
        String email = Optional.ofNullable(request.getEmail()).orElse("").trim();
        Assert.isTrue(!email.isEmpty(), "Email can't be empty!");

        //		email not exist -> new user -> sign up
        if (!emailService.isEmailExisting(email)) {
            User user = userService.fetchNewUserFromAccessByLineRequest(request);

            //			merge user
            user = userService.saveUser(user);

            //			create an account profile with new user
            profileService.createUserProfile(user);
        } else {
            User user = userService.findActiveUserByEmail(email).get();
            Assert.isTrue(user.getProvider().equals(UserProvider.LINE),
                    String.format("The email %s linked with your %s account!", user.getEmail(),
                            user.getProvider()));

            //			this is to keep posted with password change from GOOGLE account
            String password = request.getSub();
            user.setPassword(passwordService.encodePassword(password));

            //            merge user
            userService.saveUser(user);
        }

        String username = "email-login," + email;
        String password = Optional.ofNullable(request.getSub()).orElse("").trim();

        return signedJWTAuth(username, password);
    }

    @Override
    public JwtResponse signedJWTAuth(String username, String password) {

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(username, password));

        SecurityContextHolder.getContext().setAuthentication(authentication);

        String jwt = jwtUtils.generateJwtToken(authentication);

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        User account = userService.findActiveUserById(userDetails.getId()).get();
        UserProfile profile = profileService.findUserProfileByAccount(account);

        JwtResponse jwtClaims = new JwtResponse(jwt, profile, userDetails);
        // List<String> roles = userDetails.getAuthorities().stream().map(item -> item
        // .getAuthority())
        // 		.collect(Collectors.toList());

        return jwtClaims;
    }

    @Override
    public UserDetailsImpl getAuthenticatedUser() {
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal()
                .equals("anonymousUser")) {
            return null;
        }
        return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
                .getPrincipal();
    }

    @Override
    public String getClientIpAddress() {
        Object details = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (details instanceof WebAuthenticationDetails)
            return ((WebAuthenticationDetails) details).getRemoteAddress();
        return "unknown";
    }

    @Override
    public boolean isAdminAuthenticated() {
        UserDetailsImpl userDetails = getAuthenticatedUser();
        if (userDetails == null) return false;
        return userDetails.getRole() == UserRole.ADMIN ||
                userDetails.getRole() == UserRole.SUPERADMIN;
    }

    @Override
    public Profile getAuthorizedProfile(Long profileId, boolean throwError) throws AccessForbidden {

        UserDetailsImpl requester = getAuthenticatedUser();
        Profile requesterProfile = null;

        try {
            requesterProfile = profileService.findProfileById(profileId);
        } catch (Exception e) {
        }

        boolean isRequesterAdmin = requester != null && (requester.getRole() == UserRole.ADMIN ||
                requester.getRole() == UserRole.SUPERADMIN);

        if (isRequesterAdmin) return requesterProfile;

        boolean isValidRequester = requester != null && requesterProfile != null &&
                requesterProfile.getAccount().getId().equals(requester.getId());

        // if not admin, they ONLY can request under their account
        if (isValidRequester) {

            // ONLY allow activated Profile to make request
            switch (requesterProfile.getType()) {
                case USER_PROFILE: {
                    if (requester.getStatus() == UserStatus.ACTIVATED) return requesterProfile;
                }
                break;
                default:
                    break;
            }
        }

        if (throwError) {
            throw new AccessForbidden();
        }

        return null;
    }

    @Override
    public boolean getAuthorizedProfile(Profile profile, boolean throwError)
            throws AccessForbidden {
        UserDetailsImpl userDetails = getAuthenticatedUser();

        boolean adminAuthorized = userDetails != null && (userDetails.getRole() != UserRole.ADMIN ||
                userDetails.getRole() != UserRole.SUPERADMIN);

        boolean validRequester = userDetails != null && profile != null &&
                profile.getAccount().getId().equals(userDetails.getId());

        boolean authorizedAccess = adminAuthorized || validRequester;

        if (throwError && !authorizedAccess) {
            throw new AccessForbidden();
        }

        return authorizedAccess;
    }


    @Override
    public boolean getAuthorizedProfile(Profile postOwner, Post post, boolean throwError)
            throws AccessForbidden {
        UserDetailsImpl userDetails = getAuthenticatedUser();

        boolean adminAuthorized = userDetails != null && (userDetails.getRole() != UserRole.ADMIN ||
                userDetails.getRole() != UserRole.SUPERADMIN);

        boolean validRequester = userDetails != null && postOwner != null &&
                postOwner.getAccount().getId().equals(userDetails.getId());

        boolean validPostOwner = validRequester && post != null &&
                post.getOwner().getId().equals(userDetails.getId());

        boolean authorizedAccess = adminAuthorized || (validRequester && validPostOwner);

        if (throwError && !authorizedAccess) {
            throw new AccessForbidden();
        }

        return authorizedAccess;
    }

    @Override
    public boolean getAuthorizedProfile(Profile reviewer, Review review, boolean throwError)
            throws AccessForbidden {
        UserDetailsImpl userDetails = getAuthenticatedUser();

        boolean adminAuthorized = userDetails != null && (userDetails.getRole() != UserRole.ADMIN ||
                userDetails.getRole() != UserRole.SUPERADMIN);


        boolean validRequester = userDetails != null && review != null &&
                review.getReviewer().getId().equals(userDetails.getId());

        boolean validReviewer = validRequester && review != null &&
                review.getReviewer().getId().equals(reviewer.getId());

        boolean authorizedAccess = adminAuthorized || (validRequester && validReviewer);

        if (throwError && !authorizedAccess) {
            throw new AccessForbidden();
        }

        return authorizedAccess;
    }

}
