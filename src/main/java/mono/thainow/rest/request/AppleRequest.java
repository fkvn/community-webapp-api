package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppleRequest {

	private String sub;

	private String email;

	private Boolean isEmailVerified;
	
	private String name;

}
