package mono.thainow.rest.request;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.location.Location;

@Getter
@Setter
public class CompanyRequest {
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	private String industry;
	
	@Size(max = 50, message = "Email can't be more than 50 characters")
	@Email
	private String email;
	
//	 email validation - if company email has been verified
	private boolean isEmailVerified;

	@Size(max = 15, message = "Phone number can't be more than 15 digit numbers")
	private String phone;
	
//	phone validation - if company phone has been verified
	private boolean isPhoneVerified;
	
	private String description;
	
	private String website;
	
	private String founded;
	
	private String revenue;
	
	private String size;
	
	@NotNull
	private String address; 
	
	@NotNull
	private String placeid;
	
	private String administratorRole;
}
