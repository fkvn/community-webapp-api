package mono.thainow.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.rest.request.GoogleAuthRequest;
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
	public Long userSignup(UserSignupRequest signUpRequest) {
		
//		check Type of verification
		boolean isVerified = Optional.ofNullable(signUpRequest.isVerified()).orElse(false);

//		verification is required for users
		Assert.isTrue(isVerified, "Users must be verified to register!");
		
//		retrieve user information
		User user = userService.getUserFromSignupRequest(signUpRequest);

//		persist user info into database 
		user = userService.saveUser(user);
		
//		create a account profile with new user (default profilePicture)
		Profile profile = profileService.createProfile(user, null);
		
//		update user profile list
		user.getProfiles().add(profile);
		
//		update user
		user = userService.saveUser(user);
		
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
	public JwtResponse signinWithGoogle(GoogleAuthRequest googleAuthRequest) {
		
		String email = Optional.ofNullable(googleAuthRequest.getEmail().trim()).orElse("");
		
		User user = null;

//		email is not unique -> current user
		if (!userService.isEmailUnique(email)) {
			user = userService.getActiveUserByEmail(email);
		}

//		when can't retrieve current user -> new user
		if (user == null) {
			
			user = new User();
			user.setPassword(userService.encodePassword(googleAuthRequest.getSub()));
			
//			persit user
			user = userService.saveUser(user);
		}
		
//		update user
		user = userService.updateUserFromGoogleAuthRequest(user, googleAuthRequest);
		
		
//		user profile
		String profileUrl = Optional.ofNullable(googleAuthRequest.getPicture()).orElse("").trim();

//		new profile storage
		Storage profilePicture = new Storage();
		profilePicture.setUrl(profileUrl);
		profilePicture = storageService.saveStorage(profilePicture);
		
//		create a account profile with new user
		Profile profile = profileService.createProfile(user, profilePicture);
		
//		update user profile list
		user.getProfiles().add(profile);
		
//		update user
		user = userService.saveUser(user);
		
		String username = "email-login," + user.getEmail();
		String password = user.getPassword();
		
		return signedJWTAuth(username, password);
		
	}

	@Override
	public JwtResponse signedJWTAuth(String username, String password) {
		
		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(username, password));

		SecurityContextHolder.getContext().setAuthentication(authentication);

		String jwt = jwtUtils.generateJwtToken(authentication);

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		JwtResponse jwtClaims = new JwtResponse(jwt, userDetails);

//		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
//				.collect(Collectors.toList());

		return jwtClaims;
	}

}
