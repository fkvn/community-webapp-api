package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class UserSignupRequest {
	
//	if false, otp was not verified
	private boolean isVerified = false;
	
	private String username = "";

	private String password = "";
	
	private String email = "";
	
	private boolean isEmailVerified = false;

	private String phone = "";
	
	private boolean isPhoneVerified = false;

}
