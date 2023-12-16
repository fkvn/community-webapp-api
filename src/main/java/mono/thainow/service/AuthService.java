package mono.thainow.service;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.Review;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.*;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.service.impl.UserDetailsImpl;

public interface AuthService {

    void sendVerificationToken(SendTokenRequest request);

    void checkVerificationToken(VerifyTokenRequest request);

    Long signupWithThaiNowByEmail(SignupByEmailRequest request);

    JwtResponse signingWithThaiNowByEmail(SigningByEmailRequest request);

    JwtResponse signingWithThaiNowByPhone(SigningByPhoneRequest request);

    JwtResponse accessWithGoogle(AccessByGoogleRequest request);

    JwtResponse accessWithApple(AccessByAppleRequest request);

    JwtResponse accessWithFacebook(AccessByFacebookRequest request);

    JwtResponse accessWithLine(AccessByLineRequest request);

    JwtResponse signedJWTAuth(String username, String password);

    UserDetailsImpl getAuthenticatedUser();

    String getClientIpAddress();

    boolean isAdminAuthenticated();

    Profile getAuthorizedProfile(Long profileId, boolean throwError) throws AccessForbidden;

    boolean getAuthorizedProfile(Profile profile, boolean throwError) throws AccessForbidden;

    boolean getAuthorizedProfile(Profile postOwner, Post post, boolean throwError)
            throws AccessForbidden;

    boolean getAuthorizedProfile(Profile reviewer, Review review, boolean throwError)
            throws AccessForbidden;


}
