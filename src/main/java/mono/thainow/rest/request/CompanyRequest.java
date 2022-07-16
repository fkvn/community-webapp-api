package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CompanyRequest {
	
	private String name;
	
	private String industry;
	
	private String email;
	
	private boolean isEmailVerified = false;

	private String phone;
	
	private boolean isPhoneVerified = false;
	
	private boolean isInformal = false;
	
	private String description;
	
	private String website;
	
	private String founded;
	
	private String revenue;
	
	private String size;
	
	private String address; 
	
	private String placeid;
	
	private boolean withAdministrator = true;
	
	private Long administratorId;

}
