package mono.thainow.service;

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
	
	JwtResponse signupWithGoogle(GoogleSignupRequest googleAuthRequest);
	
	JwtResponse signinWithGoogle(GoogleSigninRequest googleSigninRequest);
	
	JwtResponse signedJWTAuth(String username, String password);

}
