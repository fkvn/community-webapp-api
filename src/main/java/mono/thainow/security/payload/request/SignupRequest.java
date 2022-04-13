package mono.thainow.security.payload.request;

import java.util.Set;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.location.Location;


@Getter
@Setter
public class SignupRequest {
	
////	if false, otp was not verified
//	private Boolean isVerified;
//
//	@Size(max = 50, message = "Email can't be more than 50 characters")
//	@Email
//	private String email;
//	
////	 email validation - if user uses email for otp verification
//	private boolean isEmailVerified;
//
//	@Size(max = 15, message = "Phone number can't be more than 15 digit numbers")
//	private String phone;
//	
////	phone validation - if user uses phone for otp verification
//	private boolean isPhoneVerified;
//	
//	@NotEmpty
//	private Set<String> roles;
//
//	@NotBlank
//	@Size(min = 8, max = 20)
//	private String password;
//	
//	@NotBlank
//	private String firstname = "";
//
//	@NotBlank
//	private String lastname = "";
//	
//	@NotEmpty
//	private Long playid;
	
	@NotNull
	private Location location; 

}
