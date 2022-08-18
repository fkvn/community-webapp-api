package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AppleSigninRequest {
	
	private String sub;
	
	private String email;

}
