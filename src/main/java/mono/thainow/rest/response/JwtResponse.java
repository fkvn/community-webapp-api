package mono.thainow.rest.response;

import java.util.HashMap;
import java.util.Map;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.service.impl.UserDetailsImpl;

@Getter
@Setter
public class JwtResponse {

	private String access_token;
	private String type = "Bearer";

	private Map<String, Object> user = new HashMap<>();
//	private List<Company> companies = new ArrayList<>();

	public JwtResponse(String accessToken) {
		this.access_token = accessToken;
	}

	public JwtResponse(String accessToken, UserDetailsImpl userDetails) {
		this.access_token = accessToken;
		this.user = getUserInfo(userDetails);
//		this.companies = userDetails.getCompanies();
	}

	private Map<String, Object> getUserInfo(UserDetailsImpl userDetails) {
		Map<String, Object> userInfo = new HashMap<>();

		userInfo.put("id", userDetails.getId());
		userInfo.put("username", userDetails.getUsername());
		userInfo.put("profileUrl", userDetails.getProfileUrl());
		userInfo.put("role", userDetails.getRole());
//		userInfo.put("firstname", userDetails.getFirstname());
//		userInfo.put("lastname", userDetails.getLastname());
//		userInfo.put("email", userDetails.getEmail());
//		userInfo.put("isEmailVerified", userDetails.isEmailVerified());
//		userInfo.put("isEmailPublic", userDetails.isEmailPublic());
//		userInfo.put("phone", userDetails.getPhone());
//		userInfo.put("isPhoneVerified", userDetails.isPhoneVerified());
//		userInfo.put("isPhonePublic", userDetails.isPhonePublic());
//		userInfo.put("location", userDetails.getLocation());

		return userInfo;
	}

}
