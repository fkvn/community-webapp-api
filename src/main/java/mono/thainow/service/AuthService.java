package mono.thainow.service;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.Review;
import mono.thainow.rest.request.*;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.service.impl.UserDetailsImpl;

public interface AuthService {

    void sendVerificationToken(SendTokenRequest request);

    void checkVerificationToken(VerifyTokenRequest request);

    Long registerWithThaiNow(UserRequest signUpRequest);

    JwtResponse signingWithThaiNowByEmail(SigningByEmailRequest request);

    JwtResponse signingWithThaiNowByPhone(SigningByPhoneRequest request);

    JwtResponse accessWithGoogle(AccessByGoogleRequest request);

    JwtResponse accessWithApple(AccessByAppleRequest request);

    JwtResponse accessWithFacebook(AccessByFacebookRequest request);

    JwtResponse accessWithLine(AccessByLineRequest request);

    JwtResponse signedJWTAuth(String username, String password);

    UserDetailsImpl getAuthenticatedUser();

    String getClientIpAddress();

    boolean isAccessAuthorized(Profile profile, boolean throwError);

    boolean isAdminAuthenticated();

    boolean isAccessAuthorized(Profile postOwner, Post post, boolean throwError);

    boolean isAccessAuthorized(Profile reviewer, Review review, boolean throwError);

}
