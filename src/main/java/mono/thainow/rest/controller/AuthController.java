package mono.thainow.rest.controller;

import java.util.Collections;
import java.util.Map;

import javax.validation.Valid;

import mono.thainow.rest.request.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

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
	

	@PostMapping("/thainow/signin")
	@JsonView(View.Basic.class)
	public JwtResponse signinWithThaiNow(@Valid @RequestBody UserRequest request) {
		return authService.signinWithThaiNow(request);
	}

	@PostMapping("/thainow/register")
	public Long registerWithThaiNow(@Valid @RequestBody UserRequest request) {
		Long userId = authService.registerWithThaiNow(request);
		return userId;
	}
	
	@PostMapping("/google/access")
	@JsonView(View.Basic.class)
	public JwtResponse accessWithGoogle(@Valid @RequestBody GoogleRequest request) {
		return authService.accessWithGoogle(request);
	}
	
	@PostMapping("/apple/access")
	@JsonView(View.Basic.class)
	public JwtResponse accessWithApple(@Valid @RequestBody AppleRequest signupRequest) {
		return authService.accessWithApple(signupRequest);
	}
	
	@PostMapping("/facebook/access")
	@JsonView(View.Basic.class)
	public JwtResponse accessWithFacebook(@Valid @RequestBody FacebookRequest request) {
		return authService.accessWithFacebook(request);
	}

	@PostMapping("/line/access")
	@JsonView(View.Basic.class)
	public JwtResponse accessWithLine(@Valid @RequestBody LineRequest request) {
		return authService.accessWithLine(request);
	}

	@PostMapping("/thainow/username/unique")
	public Map<String, Boolean> isUsernameUnique(@RequestParam String username) {
		return Collections.singletonMap("unique", userService.isUsernameUnique(username));
	}

	@PostMapping("/verify/phone")
	public Boolean isPhoneUnique(@RequestParam String phone) {
		return userService.isPhoneUnique(phone);
//		return Collections.singletonMap("unique", userService.isPhoneUnique(phone));
	}

	@PostMapping("/verify/email")
	public Boolean validateUserEmail(@RequestParam String email) {
		return userService.isEmailUnique(email);
//		return Collections.singletonMap("unique", userService.isEmailUnique(email));
	}
	
	@PostMapping("/change-password")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void changePassword(@Valid @RequestBody ChangePasswordRequest request) {
		authService.changePassword(request);
	}
}
