package mono.thainow.rest.controller;

import java.util.Collections;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

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

import mono.thainow.rest.request.GoogleAuthRequest;
import mono.thainow.rest.request.TokenRequest;
import mono.thainow.rest.request.UserSigninRequest;
import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.rest.response.MessageResponse;
import mono.thainow.rest.response.TokenResponse;
import mono.thainow.service.AuthService;
import mono.thainow.service.CompanyService;
import mono.thainow.service.UserService;

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
	private CompanyService companyService;

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
	
	@PostMapping("/google")
	public JwtResponse authenticateGoogleUser(@Valid @RequestBody GoogleAuthRequest signinRequest) {
		return authService.signinWithGoogle(signinRequest);
	}

	@PostMapping("/users/signin")
	public JwtResponse authenticateUser(@Valid @RequestBody UserSigninRequest signinRequest) {
		return authService.signinWithThaiNow(signinRequest);
	}

	@PostMapping("/users/signup")
	public Long registerUser(@Valid @RequestBody UserSignupRequest signUpRequest) {
		Long userId = authService.userSignup(signUpRequest);
		return userId;
	}

	@PostMapping("/users/username/unique")
	public Map<String, Boolean> isUsernameUnique(@RequestParam String username) {
		System.out.println(userService.isUsernameUnique(username));
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

	@PostMapping("/companies/validatePhone")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void validateCompanyPhone(@RequestBody Map<String, Object> companyInfo) {
		String phone = Optional.ofNullable((String) companyInfo.get("phone")).orElse("").trim();
		companyService.validateCompanyPhone(phone);
	}

	@PostMapping("/companies/validateEmail")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void validateCompanyEmail(@RequestBody Map<String, Object> companyInfo) {
		String email = Optional.ofNullable((String) companyInfo.get("email")).orElse("").trim();
		companyService.validateCompanyEmail(email);
	}
}
