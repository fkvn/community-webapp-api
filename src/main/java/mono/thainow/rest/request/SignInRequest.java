package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignInRequest {
	
	private String channel;
	
	private String email;

	private String phone;

	private String password;

}
