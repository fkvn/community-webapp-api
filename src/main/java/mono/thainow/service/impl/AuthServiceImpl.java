package mono.thainow.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.security.jwt.JwtUtils;
import mono.thainow.security.payload.request.SignInRequest;
import mono.thainow.security.payload.request.SignUpRequest;
import mono.thainow.security.payload.request.TokenRequest;
import mono.thainow.security.payload.response.JwtResponse;
import mono.thainow.security.payload.response.TokenResponse;
import mono.thainow.security.verify.TwilioVerification;
import mono.thainow.service.AuthService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private UserService userService;

	@Autowired
	private StorageService storageService;

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	JwtUtils jwtUtils;

	@Autowired
	TwilioVerification twilio;

	@Override
	public void sendVerificationToken(TokenRequest tokenRequest) {

//		inputs
		String phone = Optional.ofNullable(tokenRequest.getPhone()).orElse("").trim();
		String region = Optional.ofNullable(tokenRequest.getRegion()).orElse("").trim();
		String email = Optional.ofNullable(tokenRequest.getEmail()).orElse("").trim();
		String channel = Optional.ofNullable(tokenRequest.getChannel()).orElse("").trim();

//		send verification token
		twilio.sendVerficationToken(phone, region, email, channel);
	}

	@Override
	public void checkVerificationToken(TokenResponse tokenResponse) {

//		inputs
		String phone = Optional.ofNullable(tokenResponse.getPhone()).orElse("").trim();
		String region = Optional.ofNullable(tokenResponse.getRegion()).orElse("").trim();
		String email = Optional.ofNullable(tokenResponse.getEmail()).orElse("").trim();
		String channel = Optional.ofNullable(tokenResponse.getChannel()).orElse("").trim();
		String token = Optional.ofNullable(tokenResponse.getToken()).orElse("").trim();

//		check verification token
		twilio.checkVerficationToken(phone, region, email, channel, token);
	}

	@Override
	public boolean signUp(SignUpRequest signUpRequest) {

		User user = userService.getUserFromSignUpRequest(signUpRequest);

//		check Type of verification
		boolean isVerified = Optional.ofNullable(signUpRequest.getIsVerified()).orElse(false);

//		verification is required for classic users
		if (user.getRole() == UserRole.CLASSIC) {
			Assert.isTrue(isVerified, "Users must be verified to register!");
			user.setStatus(UserStatus.ACTIVATED);
		}

//		persist user info into database 
		user = userService.saveUser(user);

//		add user profile
		if (user.getProfileUrl() == null) {

//			this is manual add, please make sure the id is available first
			Long uploadedStorageId = (long) 35;
			Storage profile = storageService.getStorage(uploadedStorageId);

//			if found
			if (profile != null) {

//			save profile
				user.setProfileUrl(profile);

//			update user info into database 
				user = userService.saveUser(user);
			}
		}

		/*
		 * 1. Validate company information if user registered as BUSINESS 2. Add company
		 * into business 3. Revert user if company registered failed
		 */ if (user.getRole() == UserRole.BUSINESS) {

			user = userService.addBusinessCompanyFromSignUpRequest(user, signUpRequest);

			Assert.isTrue(user != null, "Company Registered Failed");

		}

		return true;
	}

	@Override
	public JwtResponse login(SignInRequest loginRequest) {

		String channel = Optional.ofNullable(loginRequest.getChannel()).orElse("");

//		only verify by email and phone
		Assert.isTrue(channel.equals("email") || channel.equals("phone"),
				"Only Email and Phone are supported at the moment!");

//		password verification
		Optional<String> password = Optional.ofNullable(loginRequest.getPassword());
		Assert.isTrue(!password.isEmpty(), "Password can't be blank!");

		String username = "";

		switch (channel) {

		case "email": {

			Optional<String> email = Optional.ofNullable(loginRequest.getEmail());

//			email is required
			Assert.isTrue(email != null && !email.isEmpty(), "Email is required for the login process!");

//			update username
			username = "email-login," + email.get();

		}
			break;

		case "phone": {

			Optional<String> phone = Optional.ofNullable(loginRequest.getPhone());

//			phone number is required
			Assert.isTrue(phone != null && !phone.isEmpty(), "Phone number is required for the login process!");

//			update username
			username = "phone-login," + phone.get();

		}
			break;

		default:
			break;
		}

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(username, password.get()));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		String jwt = jwtUtils.generateJwtToken(authentication);

//		JwtResponse jwtClaims = new JwtResponse(jwt);

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		JwtResponse jwtClaims = new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(),
				userDetails.getProfileUrl(), userDetails.getRole());

//		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
//				.collect(Collectors.toList());

		return jwtClaims;

	}

}
