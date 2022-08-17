package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoogleSigninRequest {
	
	private String sub;
	
	private String email;

}
