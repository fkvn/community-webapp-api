package mono.thainow.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

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
import mono.thainow.service.UserService;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private UserService userService;

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

		/*
		 * 1. Validate company information if user registered as BUSINESS 
		 * 2. Add company into business
		 * 3. Revert user if company registered failed
		 */ if (user.getRole() == UserRole.BUSINESS) {

			user = userService.addBusinessCompanyFromSignUpRequest(user, signUpRequest);
			
			Assert.isTrue(user != null, "Company Registered Failed" );

		}

		return true;
	}

	@Override
	public JwtResponse signin(SignInRequest loginRequest) {

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

		JwtResponse jwtClaims = new JwtResponse(jwt);

//		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
//		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
//				.collect(Collectors.toList());
//		JwtResponse jwtClaims = new JwtResponse(jwt, userDetails.getId(), userDetails.getUsername(),
//				userDetails.getEmail(), roles);

		return jwtClaims;

	}

}
