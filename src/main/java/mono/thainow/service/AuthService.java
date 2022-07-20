package mono.thainow.service;

import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.security.payload.request.SignInRequest;
import mono.thainow.security.payload.request.TokenRequest;
import mono.thainow.security.payload.response.JwtResponse;
import mono.thainow.security.payload.response.TokenResponse;

public interface AuthService {
	
	void sendVerificationToken(TokenRequest tokenRequest);
	
	void checkVerificationToken(TokenResponse tokenResponse);
	
	boolean signUp(UserSignupRequest signUpRequest);
	
	JwtResponse signin(SignInRequest loginRequest);

}
