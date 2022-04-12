package mono.thainow.security.payload.request;

import java.util.Set;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignupRequest {
	
//	if false, verify by Email
	private Boolean isPhoneVerified = null;

	@Size(max = 50)
	@Email
	private String email;

	@NotBlank
	@Size(min=10, max = 10)
	private String phone;
	
	

	private Set<String> roles;

	@NotBlank
	@Size(min = 8, max = 20)
	private String password;

	@NotBlank
	private String username = "";
	
	@NotBlank
	private String firstname = "";

	@NotBlank
	private String lastname = "";

}
