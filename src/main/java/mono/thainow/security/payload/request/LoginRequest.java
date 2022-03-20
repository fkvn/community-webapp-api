package mono.thainow.security.payload.request;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginRequest {
	
	private boolean isEmailLogin;
	
	@Size(max = 50)
	private String email;
	
	@Size(min=10, max = 10)
	private String phone;
	
	private String username;

	@NotBlank
	private String password;

}
