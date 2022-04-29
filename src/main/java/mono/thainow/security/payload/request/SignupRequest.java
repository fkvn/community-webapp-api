package mono.thainow.security.payload.request;

import java.util.Set;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;


@Getter
@Setter
public class SignUpRequest {
	
//	if false, otp was not verified
	private Boolean isVerified;

	@Size(max = 50, message = "Email can't be more than 50 characters")
	@Email
	private String email;
	
//	 email validation - if user uses email for otp verification
	private boolean isEmailVerified;

	@Size(max = 15, message = "Phone number can't be more than 15 digit numbers")
	private String phone;
	
//	phone validation - if user uses phone for otp verification
	private boolean isPhoneVerified;
	
	private Set<String> privileges;
	
	@NotEmpty
	private String role;

	@NotBlank
	@Size(min = 8, max = 20)
	private String password;
	
	@NotBlank
	private String firstname = "";

	@NotBlank
	private String lastname = "";
	
	@NotNull
	private Location location; 

//	Business account Information
	private Company company; 
	
	
}
