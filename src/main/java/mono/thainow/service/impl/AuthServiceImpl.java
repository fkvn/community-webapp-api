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
import mono.thainow.rest.request.GoogleSignInRequest;
import mono.thainow.rest.request.SignInRequest;
import mono.thainow.rest.request.TokenRequest;
import mono.thainow.rest.request.UserSignupRequest;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.rest.response.TokenResponse;
import mono.thainow.security.jwt.JwtUtils;
import mono.thainow.service.AuthService;
import mono.thainow.service.StorageService;
import mono.thainow.service.TwilioService;
import mono.thainow.service.UserService;

@Service
public class AuthServiceImpl implements AuthService {

	@Autowired
	private UserService userService;

//	@Autowired
//	private CompanyService companyService;

	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	JwtUtils jwtUtils;

	@Autowired
	TwilioService twilioService;
	
	@Autowired
	StorageService storageService;

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
	public boolean signUp(UserSignupRequest signUpRequest) {

		User user = userService.getUserFromSignUpRequest(signUpRequest);

//		check Type of verification
		boolean isVerified = Optional.ofNullable(signUpRequest.isVerified()).orElse(false);

//		verification is required for users
		Assert.isTrue(isVerified, "Users must be verified to register!");

//		persist user info into database 
		user = userService.saveUser(user);

		/*
		 * 1. Validate company information if user registered as BUSINESS 2. Add company
		 * into business 3. Revert user if company registered failed
		 */
//		if (user.getRole() == UserRole.BUSINESS) {
//
////			add company
//			Company company = companyService.getCompanyFromRequest(signUpRequest.getCompany());
//			
////			bind business profile url with company logo url
//			company.setLogoUrl(user.getProfileUrl());
//			
////			persist company
//			company = companyService.saveCompany(company);
//			
//			
////			bind business location with company location
//			user.setLocation(company.getLocation());
//			user = userService.saveUser(user);
//			
////			update company and business relationship
//			String administratorRole = Optional.ofNullable(signUpRequest.getAdministratorRole()).orElse("");
//			
////			company - user
//			BusinessUser businessUser = (BusinessUser) user;
//			company.setAdministratorRole(administratorRole);
//			company.setAdministrator(businessUser);
//			company = companyService.saveCompany(company);
//			
////			user - company
//			businessUser.getCompanies().add(company);
//			businessUser = (BusinessUser) userService.saveUser(businessUser);

//		}

		return true;
	}

	@Override
	public JwtResponse signin(SignInRequest signinRequest) {

		String channel = Optional.ofNullable(signinRequest.getChannel()).orElse("");

//		only verify by email and phone
		Assert.isTrue(channel.equals("email") || channel.equals("phone"),
				"Only Email and Phone are supported at the moment!");

//		password verification
		Optional<String> password = Optional.ofNullable(signinRequest.getPassword());
		Assert.isTrue(!password.isEmpty(), "Password can't be blank!");

		String username = "";

		switch (channel) {

		case "email": {

			Optional<String> email = Optional.ofNullable(signinRequest.getEmail());

//			email is required
			Assert.isTrue(email != null && !email.isEmpty(), "Email is required for the login process!");

//			update username
			username = "email-login," + email.get();

		}
			break;

		case "phone": {

			Optional<String> phone = Optional.ofNullable(signinRequest.getPhone());

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
		JwtResponse jwtClaims = new JwtResponse(jwt, userDetails);

//		List<String> roles = userDetails.getAuthorities().stream().map(item -> item.getAuthority())
//				.collect(Collectors.toList());

		return jwtClaims;

	}

	@Override
	public JwtResponse googleSignin(GoogleSignInRequest googleSigninRequest) {
		
//		get user
		User user = userService.getUserFromGoogleSignInRequest(googleSigninRequest);
		
//		persit user
		user = userService.saveUser(user);
		
//		validate process
		String username = "email-login," + user.getEmail();
		
		Authentication authentication = authenticationManager
				.authenticate(new UsernamePasswordAuthenticationToken(username, user.getPassword()));
		
		SecurityContextHolder.getContext().setAuthentication(authentication);

		String jwt = jwtUtils.generateJwtToken(authentication);

		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
		
		JwtResponse jwtClaims = new JwtResponse(jwt, userDetails);

		return jwtClaims;
		
	}

}
