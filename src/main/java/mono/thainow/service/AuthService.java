package mono.thainow.service;

import javax.validation.Valid;

import mono.thainow.rest.request.AppleRequest;
import mono.thainow.rest.request.ChangePasswordRequest;
import mono.thainow.rest.request.FacebookRequest;
import mono.thainow.rest.request.GoogleRequest;
import mono.thainow.rest.request.TokenRequest;
import mono.thainow.rest.request.UserRequest;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.rest.response.TokenResponse;

public interface AuthService {
	
	void sendVerificationToken(TokenRequest tokenRequest);
	
	void checkVerificationToken(TokenResponse tokenResponse);
	
	Long registerWithThaiNow(UserRequest signUpRequest);
	
	JwtResponse signinWithThaiNow(UserRequest request);
	
	JwtResponse accessWithGoogle(GoogleRequest request);
	
	JwtResponse accessWithApple(AppleRequest request);
	
	JwtResponse accessWithFacebook(FacebookRequest request);
	
	JwtResponse signedJWTAuth(String username, String password);

	void changePassword(@Valid ChangePasswordRequest request);

}
