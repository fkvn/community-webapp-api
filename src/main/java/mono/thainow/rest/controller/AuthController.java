package mono.thainow.rest.controller;

import java.util.Collections;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

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
import mono.thainow.rest.response.MessageResponse;
import mono.thainow.rest.response.TokenResponse;
import mono.thainow.service.AuthService;
import mono.thainow.service.UserService;
import mono.thainow.view.View;

// 30 secs
@CrossOrigin(origins = "*", maxAge = 36000)
@RestController
@RequestMapping("/api/auth")
public class AuthController {

	@Autowired
	private AuthService authService;

	@Autowired
	private UserService userService;

	@Autowired
	PasswordEncoder encoder;

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
	

	@PostMapping("/users/signin")
	@JsonView(View.Basic.class)
	public JwtResponse signinUser(@Valid @RequestBody UserSigninRequest signinRequest) {
		return authService.signinWithThaiNow(signinRequest);
	}

	@PostMapping("/users/signup")
	public Long signupUser(@Valid @RequestBody UserSignupRequest signUpRequest) {
		Long userId = authService.signupWithThaiNow(signUpRequest);
		return userId;
	}
	
	@PostMapping("/google/signin")
	@JsonView(View.Basic.class)
	public JwtResponse signinGoogleUser(@Valid @RequestBody GoogleSigninRequest signinRequest) {
		return authService.signinWithGoogle(signinRequest);
	}
	
	@PostMapping("/google/signup")
	@JsonView(View.Basic.class)
	public JwtResponse signupGoogleUser(@Valid @RequestBody GoogleSignupRequest signupRequest) {
		return authService.signupWithGoogle(signupRequest);
	}
	
	@PostMapping("/apple/signin")
	@JsonView(View.Basic.class)
	public JwtResponse signinAppleUser(@Valid @RequestBody AppleSigninRequest signinRequest) {
		return authService.signinWithApple(signinRequest);
	}
	
	@PostMapping("/apple/signup")
	@JsonView(View.Basic.class)
	public JwtResponse signupAppleUser(@Valid @RequestBody AppleSignupRequest signupRequest) {
		return authService.signupWithApple(signupRequest);
	}
	
	@PostMapping("/facebook/signin")
	@JsonView(View.Basic.class)
	public JwtResponse signinFacebookUser(@Valid @RequestBody FacebookSigninRequest signinRequest) {
		return authService.signinWithFacebook(signinRequest);
	}
	
	@PostMapping("/facebook/signup")
	@JsonView(View.Basic.class)
	public JwtResponse signupFacebookUser(@Valid @RequestBody FacebookSignupRequest signupRequest) {
		return authService.signupWithFacebook(signupRequest);
	}

	@PostMapping("/users/username/unique")
	public Map<String, Boolean> isUsernameUnique(@RequestParam String username) {
		return Collections.singletonMap("unique", userService.isUsernameUnique(username));
	}

	@PostMapping("/users/phone/unique")
	public Map<String, Boolean> isPhoneUnique(@RequestParam String phone) {
		return Collections.singletonMap("unique", userService.isPhoneUnique(phone));
	}

	@PostMapping("/users/email/unique")
	public Map<String, Boolean> validateUserEmail(@RequestParam String email) {
		return Collections.singletonMap("unique", userService.isEmailUnique(email));
	}
}
