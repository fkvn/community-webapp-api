package mono.thainow.rest.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.security.payload.request.LoginRequest;
import mono.thainow.security.payload.request.SignupRequest;
import mono.thainow.security.payload.request.TokenRequest;
import mono.thainow.security.payload.response.JwtResponse;
import mono.thainow.security.payload.response.MessageResponse;
import mono.thainow.security.payload.response.TokenResponse;
import mono.thainow.service.AuthService;

// 30 secs
@CrossOrigin(origins = "*", maxAge = 36000)
@RestController
@RequestMapping("/api/auth")
public class AuthController {

	@Autowired
	private AuthService authService;

	@Autowired
	PasswordEncoder encoder;

	@PostMapping("/signin")
	public JwtResponse authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {

		return authService.signin(loginRequest);
	}

	@PostMapping("/getToken")
	public MessageResponse getToken(@Valid @RequestBody TokenRequest tokenRequest) {

		authService.sendVerificationToken(tokenRequest);

		return new MessageResponse("Token was sent successfully!");
	}
	
	@PostMapping("/verifyToken")
	public MessageResponse verifyToken(@Valid @RequestBody TokenResponse tokenResponse) {

		authService.checkVerificationToken(tokenResponse);

		return new MessageResponse("Token was verified successfully!");
	}
	

	@PostMapping("/signup")
	public MessageResponse registerUser(@Valid @RequestBody SignupRequest signUpRequest) {

		Assert.isTrue(authService.signUp(signUpRequest), "Registration Failed!");

		return new MessageResponse("User registered successfully!");
	}
}
