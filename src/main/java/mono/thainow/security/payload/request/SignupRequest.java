package mono.thainow.security.payload.request;

import java.util.HashSet;
import java.util.Set;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.rest.request.CompanyRequest;


@Getter
@Setter
public class SignupRequest {
	
//	if false, otp was not verified
	private Boolean isVerified = false;
	
	private String role;

	private String email;
	private boolean isEmailVerified = false;

	private String phone;
	private boolean isPhoneVerified = false;
	
	private Set<String> privileges = new HashSet<>();

	private String password;
	
	private String username = "";
	
	private String firstname = "";

	private String lastname = "";
	
	private String address; 
	
	private String placeid;

//	Business account Information
	private CompanyRequest company; 
	
	private String administratorRole;
	
}
