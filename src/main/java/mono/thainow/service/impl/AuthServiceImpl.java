package mono.thainow.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;
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
import mono.thainow.rest.response.TokenResponse;
import mono.thainow.security.jwt.JwtUtils;
import mono.thainow.service.AuthService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.StorageService;
import mono.thainow.service.TwilioService;
import mono.thainow.service.UserService;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private UserService userService;

	@Autowired
	private ProfileService profileService;

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	JwtUtils jwtUtils;

	@Autowired
	TwilioService twilioService;

	@Autowired
	StorageService storageService;

//	======================================================================

	@Override
	public void sendVerificationToken(TokenRequest tokenRequest) {

//		inputs
		String phone = Optional.ofNullable(tokenRequest.getPhone()).orElse("").trim();
		String region = Optional.ofNullable(tokenRequest.getRegion()).orElse("").trim();
		String email = Optional.ofNullable(tokenRequest.getEmail()).orElse("").trim();
		String channel = Optional.ofNullable(tokenRequest.getChannel()).orElse("").trim();

//		send verification token
		twilioService.sendVerficationToken(phone, region, email, channel);
	}

	@Override
	public void checkVerificationToken(TokenResponse tokenResponse) {

//		inputs
		String phone = Optional.ofNullable(tokenResponse.getPhone()).orElse("").trim();
		String region = Optional.ofNullable(tokenResponse.getRegion()).orElse("US").trim();
		String email = Optional.ofNullable(tokenResponse.getEmail()).orElse("").trim();
		String channel = Optional.ofNullable(tokenResponse.getChannel()).orElse("").trim();
		String token = Optional.ofNullable(tokenResponse.getToken()).orElse("").trim();

//		check verification token
		twilioService.checkVerficationToken(phone, region, email, channel, token);
	}

	@Override
	public Long signupWithThaiNow(UserSignupRequest signUpRequest) {

//		check Type of verification
		boolean isVerified = Optional.ofNullable(signUpRequest.isVerified()).orElse(false);

//		verification is required for users
		Assert.isTrue(isVerified, "Users must be verified to register!");

//		retrieve user information
		User user = userService.getUserFromSignupRequest(signUpRequest);

//		persist user info into database 
		user = userService.saveUser(user);

//		create a account profile with new user
		profileService.createProfile(user);

		return user.getId();
	}

	@Override
	public JwtResponse signinWithThaiNow(UserSigninRequest userSigninRequest) {

		String channel = Optional.ofNullable(userSigninRequest.getChannel()).orElse("");

//		only verify by email and phone
		Assert.isTrue(channel.equals("email") || channel.equals("phone"),
				"Only Email and Phone are supported at the moment!");

//		password verification
		String password = Optional.ofNullable(userSigninRequest.getPassword()).orElse("").trim();

		String username = "";

		switch (channel) {

		case "email": {

			String email = Optional.ofNullable(userSigninRequest.getEmail()).orElse("").trim();

//			email is required
			Assert.isTrue(!email.isEmpty(), "Email is required!");

//			update username
			username = "email-login," + email;

		}
			break;

		case "phone": {

			String phone = Optional.ofNullable(userSigninRequest.getPhone()).orElse("").trim();

//			phone number is required
			Assert.isTrue(!phone.isEmpty(), "Phone number is required!");

//			update username
			username = "phone-login," + phone;

		}
			break;

		default:
			break;
		}

		return signedJWTAuth(username, password);

	}

	@Override
	public JwtResponse signinWithGoogle(GoogleSigninRequest googleSigninRequest) {

		String email = Optional.ofNullable(googleSigninRequest.getEmail().trim()).orElse("");
		String password = Optional.ofNullable(googleSigninRequest.getSub().trim()).orElse("");

//		internal custom username - used for sign in only, not user's username
		String username = "email-login," + email;

		return signedJWTAuth(username, password);

	}

	@Override
	public JwtResponse signupWithGoogle(GoogleSignupRequest googleSignupRequest) {

		String email = Optional.ofNullable(googleSignupRequest.getEmail().trim()).orElse("");

//		email is unique -> new user -> sign up
		if (userService.isEmailUnique(email)) {
			User user = userService.getUserFromGoogleSignupRequest(googleSignupRequest);

//			persit user
			user = userService.saveUser(user);

//			create a account profile with new user
			profileService.createProfile(user);
		} else {
			User user = userService.getActiveUserByEmail(email);
			Assert.isTrue(user.getProvider().equals("GOOGLE"), "The email linked with this account has already taken!");
		}

//		return to sign in
		GoogleSigninRequest signinRequest = new GoogleSigninRequest();
		signinRequest.setEmail(googleSignupRequest.getEmail());
		signinRequest.setSub(googleSignupRequest.getSub());

		return signinWithGoogle(signinRequest);
	}

	@Override
	public JwtResponse signedJWTAuth(String username, String password) {

		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(username, password));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		String jwt = jwtUtils.generateJwtToken(authentication);

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

		User account = userService.getActiveUserByEmail(userDetails.getEmail());
		UserProfile profile = profileService.getUserProfile(account);

		JwtResponse jwtClaims = new JwtResponse(jwt, userDetails);
		jwtClaims.setProfile(profile);

//		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
//				.collect(Collectors.toList());

		return jwtClaims;
	}

	@Override
	public JwtResponse signupWithApple(AppleSignupRequest appleSignupRequest) {

		String email = Optional.ofNullable(appleSignupRequest.getEmail().trim()).orElse("");

//		email is unique -> new user -> sign up
		if (userService.isEmailUnique(email)) {
			User user = userService.getUserFromAppleSignupRequest(appleSignupRequest);

//			persit user
			user = userService.saveUser(user);

//			create a account profile with new user
			profileService.createProfile(user);
		} else {
			User user = userService.getActiveUserByEmail(email);
			Assert.isTrue(user.getProvider().equals("APPLE"), "The email linked with this account has already taken!");
		}

//		return to sign in
		AppleSigninRequest signinRequest = new AppleSigninRequest();
		signinRequest.setEmail(appleSignupRequest.getEmail());
		signinRequest.setSub(appleSignupRequest.getSub());

		return signinWithApple(signinRequest);
	}

	@Override
	public JwtResponse signinWithApple(AppleSigninRequest appleSigninRequest) {

		String email = Optional.ofNullable(appleSigninRequest.getEmail().trim()).orElse("");
		String password = Optional.ofNullable(appleSigninRequest.getSub().trim()).orElse("");

//		internal custom username - used for sign in only, not user's username
		String username = "email-login," + email;

		return signedJWTAuth(username, password);
	}

	@Override
	public JwtResponse signupWithFacebook(FacebookSignupRequest facebookSignupRequest) {

		String email = Optional.ofNullable(facebookSignupRequest.getEmail().trim()).orElse("");

//		email is unique -> new user -> sign up
		if (userService.isEmailUnique(email)) {
			User user = userService.getUserFromFacebookSignupRequest(facebookSignupRequest);

//			persit user
			user = userService.saveUser(user);

//			create a account profile with new user
			profileService.createProfile(user);
		} else {
			User user = userService.getActiveUserByEmail(email);
			Assert.isTrue(user.getProvider().equals("FACEBOOK"),
					"The email linked with this account has already taken!");
		}

//		return to sign in
		FacebookSigninRequest signinRequest = new FacebookSigninRequest();
		signinRequest.setEmail(facebookSignupRequest.getEmail());
		signinRequest.setId(facebookSignupRequest.getId());

		return signinWithFacebook(signinRequest);
	}

	@Override
	public JwtResponse signinWithFacebook(FacebookSigninRequest facebookSigninRequest) {

		String email = Optional.ofNullable(facebookSigninRequest.getEmail().trim()).orElse("");
		String password = Optional.ofNullable(facebookSigninRequest.getId().trim()).orElse("");

//		internal custom username - used for sign in only, not user's username
		String username = "email-login," + email;

		return signedJWTAuth(username, password);
	}

}
