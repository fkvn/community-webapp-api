package mono.thainow.service;

import mono.thainow.rest.request.AppleSigninRequest;
import mono.thainow.rest.request.AppleSignupRequest;
import mono.thainow.rest.request.FacebookSigninRequest;
import mono.thainow.rest.request.FacebookSignupRequest;
import mono.thainow.rest.request.GoogleSigninRequest;
import mono.thainow.rest.request.GoogleSignupRequest;
import mono.thainow.rest.request.TokenRequest;
import mono.thainow.rest.request.UserSigninRequest;
import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.rest.response.TokenResponse;

public interface AuthService {
	
	void sendVerificationToken(TokenRequest tokenRequest);
	
	void checkVerificationToken(TokenResponse tokenResponse);
	
	Long signupWithThaiNow(UserSignupRequest signUpRequest);
	
	JwtResponse signinWithThaiNow(UserSigninRequest userSigninRequest);
	
	JwtResponse signupWithGoogle(GoogleSignupRequest googleSignupRequest);
	
	JwtResponse signinWithGoogle(GoogleSigninRequest googleSigninRequest);
	
	JwtResponse signupWithApple(AppleSignupRequest appleSignupRequest);
	
	JwtResponse signinWithApple(AppleSigninRequest appleSigninRequest);
	
	JwtResponse signupWithFacebook(FacebookSignupRequest facebookSignupRequest);
	
	JwtResponse signinWithFacebook(FacebookSigninRequest facebookSigninRequest);
	
	JwtResponse signedJWTAuth(String username, String password);

}
