package mono.thainow.service;

import mono.thainow.security.payload.request.LoginRequest;
import mono.thainow.security.payload.request.SignupRequest;
import mono.thainow.security.payload.response.JwtResponse;

public interface AuthService {
	
	boolean signUp(SignupRequest signUpRequest);
	JwtResponse signin(LoginRequest loginRequest);
}
