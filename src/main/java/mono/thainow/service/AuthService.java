package mono.thainow.service;

import javax.validation.Valid;

import mono.thainow.rest.request.*;
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

	JwtResponse accessWithLine(LineRequest request);
	
	JwtResponse signedJWTAuth(String username, String password);

	void changePassword(@Valid ChangePasswordRequest request);


}
