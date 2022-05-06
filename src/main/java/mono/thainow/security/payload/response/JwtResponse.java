package mono.thainow.security.payload.response;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.UserRole;

@Getter
@Setter
public class JwtResponse {

	private String access_token;
	private String type = "Bearer";
	private Long id;
	private String username;
	private Storage profileUrl;
	private UserRole role;
	
	public JwtResponse(String accessToken) {
		this.access_token = accessToken;
	}

	public JwtResponse(String accessToken, Long id, String username, Storage profileUrl, UserRole role) {
		this.access_token = accessToken;
		this.id = id;
		this.username = username;
		this.profileUrl = profileUrl;
		this.role = role;
	}

//	public JwtResponse(String accessToken, Long id, String username, String email, List<String> roles) {
//		this.token = accessToken;
//		this.id = id;
//		this.username = username;
//		this.email = email;
//		this.roles = roles;
//	}

}
