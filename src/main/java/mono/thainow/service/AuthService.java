package mono.thainow.service;

import mono.thainow.rest.request.GoogleSignInRequest;
import mono.thainow.rest.request.SignInRequest;
import mono.thainow.rest.request.TokenRequest;
import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.rest.response.TokenResponse;

public interface AuthService {
	
	void sendVerificationToken(TokenRequest tokenRequest);
	
	void checkVerificationToken(TokenResponse tokenResponse);
	
	boolean signUp(UserSignupRequest signUpRequest);
	
	JwtResponse signin(SignInRequest loginRequest);
	
	JwtResponse googleSignin(GoogleSignInRequest googleSigninRequest);

}
