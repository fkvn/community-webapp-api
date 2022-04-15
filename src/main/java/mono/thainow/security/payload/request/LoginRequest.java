package mono.thainow.security.payload.request;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginRequest {
	
	private boolean isEmailLogin;
	
	@NotEmpty( message = "Channel can't be empty")
	private String channel;
	
	@Size(max = 50, message = "Email can't be more than 50 characters")
	@Email
	private String email;

	@Size(max = 15, message = "Phone number can't be more than 15 digit numbers")
	private String phone;

	@NotEmpty
	private String password;

}
