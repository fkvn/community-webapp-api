package mono.thainow.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.fasterxml.jackson.core.JsonParser;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;

import mono.thainow.domain.location.Location;
import mono.thainow.security.jwt.JwtUtils;
import mono.thainow.security.payload.request.LoginRequest;
import mono.thainow.security.payload.request.SignupRequest;
import mono.thainow.security.payload.request.TokenRequest;
import mono.thainow.security.payload.response.JwtResponse;
import mono.thainow.security.payload.response.TokenResponse;
import mono.thainow.security.verify.TwilioVerification;
import mono.thainow.service.AuthService;
import mono.thainow.service.UserRoleService;
import mono.thainow.service.UserService;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private UserRoleService userRoleService;

	@Autowired
	private UserService userService;

	@Autowired
	private PasswordEncoder encoder;

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	JwtUtils jwtUtils;
	
	@Autowired
	TwilioVerification twilio;
	
	
	@Override
	public void sendVerificationToken(TokenRequest tokenRequest) {
		
//		inputs
		String phone = Optional.ofNullable(tokenRequest.getPhone().trim()).orElse("");
		String region = Optional.ofNullable(tokenRequest.getRegion().trim()).orElse("");
		String email = Optional.ofNullable(tokenRequest.getEmail().trim()).orElse("");
		String channel = Optional.ofNullable(tokenRequest.getChannel().trim()).orElse("");
		
//		send verification token
		twilio.sendVerficationToken(phone, region, email, channel);
	}
	
	@Override
	public void checkVerificationToken(TokenResponse tokenResponse) {
		
//		inputs
		String phone = Optional.ofNullable(tokenResponse.getPhone().trim()).orElse("");
		String region = Optional.ofNullable(tokenResponse.getRegion().trim()).orElse("");
		String email = Optional.ofNullable(tokenResponse.getEmail().trim()).orElse("");
		String channel = Optional.ofNullable(tokenResponse.getChannel().trim()).orElse("");
		String token = Optional.ofNullable(tokenResponse.getToken().trim()).orElse("");

//		check verification token
		twilio.checkVerficationToken(phone, region, email, channel, token);
	}


	@Override
	public boolean signUp(SignupRequest signUpRequest) {
		
////		validate users' roles
//		Set<String> strRoles = signUpRequest.getRoles();
//
//		Set<UserRole> roles = userRoleService.verifyRoles(strRoles);
//
//		Assert.isTrue(!(roles.contains(UserRole.CLASSIC) && roles.contains(UserRole.BUSINESS)),
//				"A user cannot be both classic and business");
//
////		check Type of verification
//		Boolean isVerified = Optional.ofNullable(signUpRequest.getIsVerified()).orElse(false);
//		
////		verification is required for classic users
//		Assert.isTrue(roles.contains(UserRole.CLASSIC) && !isVerified, "Users must be verified to register!");
//		
////		create a new user
//		User user = new User();
//		
////		user's profile information 
//		String firstName = Optional.ofNullable(signUpRequest.getFirstname()).orElse(null);
//		String lastName = Optional.ofNullable(signUpRequest.getLastname()).orElse(null);
//		
////		add user profile information
//		user.setFirstName(firstName);
//		user.setLastName(lastName);
//		
////		password validation
//		Optional<String> password = Optional.ofNullable(signUpRequest.getPassword());
//		PasswordUtil.verifyPassword(password.get());
//		
//		// password encoded
//		String encodedPwd = encoder.encode(password.get());
//		
////		add user password
//		user.setPassword(encodedPwd);
		
		
		Location location = Optional.ofNullable(signUpRequest.getLocation()).orElse(new Location());
		
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String prettyJsonString = gson.toJson(location);
		
		System.out.println(prettyJsonString);

//		String username = Optional.ofNullable(signUpRequest.getUsername()).orElse(null);
//		String firstName = Optional.ofNullable(signUpRequest.getFirstname()).orElse(null);
//		String lastName = Optional.ofNullable(signUpRequest.getLastname()).orElse(null);
//		String fullName = firstName + lastName;
//

//
//		if (!phone.isEmpty()) {
//			util.valPhoneNo(phone);
//		}
//
//		Optional<String> password = Optional.ofNullable(signUpRequest.getPassword());
//		String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,20}$";
//		
//		Assert.isTrue(password.get().matches(passwordRegex),
//				"Your password must be between 8 and 20 characters (at least 1 upper, 1 lower, 1 number, and no white space)");
//
//		// encoding
//		String encodedPwd = encoder.encode(password.get());
//		String sub = encoder.encode(phone);
//

//
//		// create a new user
//		User user = new User();
//		user.setSub(sub);
//		user.setEmail(email);
//		user.setPassword(encodedPwd);
//		user.setUsername(username);
//		user.setFirstName(firstName);
//		user.setLastName(lastName);
//		user.setFullName(fullName);
//		user.setPhone(phone);
//		user.setPhoneVerified(isPhoneVerified);
//		user.setRoles(roles);
//		user.setStatus(UserStatus.ACTIVE);
//
//		user = userService.saveUser(user);

		return true;
	}

	@Override
	public JwtResponse signin(LoginRequest loginRequest) {

		Optional<String> email = Optional.ofNullable(loginRequest.getEmail());
		Optional<String> phone = Optional.ofNullable(loginRequest.getPhone());
		boolean isEmailLogin = Optional.ofNullable(loginRequest.isEmailLogin()).orElse(null);
		Optional<String> password = Optional.ofNullable(loginRequest.getPassword());
		String username = Optional.ofNullable(loginRequest.getUsername()).orElse(null);
		
		Assert.isTrue(!password.isEmpty(), "Password can't be blank!");

		if (isEmailLogin) {
			Assert.isTrue(!email.isEmpty(), "Email address can't be blank!");

			// because the UsernamePasswordAuthenticationToken
			// loadUserByUsername only take 1 argument in
			username = "email-login," + email.get();
		} else {
			Assert.isTrue(!phone.isEmpty(), "Phone can't be blank!");
			// because the UsernamePasswordAuthenticationToken 
			// loadUserByUsername only take 1 argument in
			username = "phone-login," + phone.get();
		}

		Authentication authentication = authenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(username, password.get()));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		String jwt = jwtUtils.generateJwtToken(authentication);

		JwtResponse jwtClaims = new JwtResponse(jwt);

//		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
//		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
//				.collect(Collectors.toList());
//		JwtResponse jwtClaims = new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(),
//				userDetails.getEmail(), roles);

		return jwtClaims;

	}




}
