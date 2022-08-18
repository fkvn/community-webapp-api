package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppleSignupRequest {

	private String sub;

	private String email;

	private boolean email_verified = false;
	
	private String name;

}
