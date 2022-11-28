package mono.thainow.rest.request;

import lombok.Getter;

@Getter
public class ChangePasswordRequest {

//	use to determine user by email or phone
	private String channel;
	
	private String phone;
	
	private String email;
	
	private String password;
	
	
}
