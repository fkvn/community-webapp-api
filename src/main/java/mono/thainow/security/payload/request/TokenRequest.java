package mono.thainow.security.payload.request;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TokenRequest {
	
	@Size(max = 15, message = "Phone number can't be more than 15 digit numbers")
	private String phone;
	
	@Size(max = 2, message = "Region can't be more than 2 characters")
	private String region = "us";
	
	@Size(max = 50, message = "Email can't be more than 50 characters")
	@Email
	private String email;
	
	@NotEmpty( message = "Channel can't be empty")
	private String channel;

}
