package mono.thainow.service;

import mono.thainow.rest.request.GoogleAuthRequest;
import mono.thainow.rest.request.TokenRequest;
import mono.thainow.rest.request.UserSigninRequest;
import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.rest.response.TokenResponse;

public interface AuthService {
	
	void sendVerificationToken(TokenRequest tokenRequest);
	
	void checkVerificationToken(TokenResponse tokenResponse);
	
	Long userSignup(UserSignupRequest signUpRequest);
	
	
	JwtResponse signedJWTAuth(String username, String password);
	
	JwtResponse signinWithGoogle(GoogleAuthRequest googleAuthRequest);
	
	JwtResponse signinWithThaiNow(UserSigninRequest userSigninRequest);

}
