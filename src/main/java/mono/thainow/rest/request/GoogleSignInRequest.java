package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoogleSignInRequest {
	
	private String sub;
	
	private String email;
	private boolean email_verified = false;

	private String name;
	
	private String picture;
	
	private String given_name;
	
	private String family_name;

}
