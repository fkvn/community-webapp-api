package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FacebookRequest {

	private String id;

	private String email;

	private boolean email_verified = false;
	
	private String name;
	
	private String picture;

}
