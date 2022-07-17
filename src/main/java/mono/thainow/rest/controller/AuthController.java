package mono.thainow.rest.controller;

import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.security.payload.request.SignInRequest;
import mono.thainow.security.payload.request.SignupRequest;
import mono.thainow.security.payload.request.TokenRequest;
import mono.thainow.security.payload.response.JwtResponse;
import mono.thainow.security.payload.response.MessageResponse;
import mono.thainow.security.payload.response.TokenResponse;
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
	
	@PostMapping("/signin")
	public JwtResponse authenticateUser(@Valid @RequestBody SignInRequest loginRequest) {

		return authService.signin(loginRequest);
	}


	@PostMapping("/signup")
	public MessageResponse registerUser(@Valid @RequestBody SignupRequest signUpRequest) {

		Assert.isTrue(authService.signUp(signUpRequest), "Registration Failed!");

		return new MessageResponse("User registered successfully!");
	}
	
	@PostMapping("/users/validateUsername")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void validateUsername(@RequestParam String username) {
		userService.validateUsername(username.trim());
	}

	@PostMapping("/users/validatePhone")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void validateUserPhone(@RequestBody Map<String, Object> userInfo) {
		String phone = Optional.ofNullable((String) userInfo.get("phone")).orElse("").trim();
		userService.validateUserPhone(phone);
	}
	
	@PostMapping("/users/validateEmail")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void validateUserEmail(@RequestBody Map<String, Object> userInfo) {
		String email = Optional.ofNullable((String) userInfo.get("email")).orElse("").trim();
		userService.validateUserEmail(email);
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
