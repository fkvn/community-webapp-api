package mono.thainow.rest.request;

import java.util.List;

import lombok.Getter;

@Getter
public class UserRequest {
	
//	Sign UP ONLY  - if false, otp was not verified
	private Boolean isVerified;
	
//	Sign IN ONLY  - use to determine sign in by email or phone
	private String channel;

	private String password;

	private String username;
	
	private String firstname;
	
	private String lastname;
	
	private List<StorageRequest> pictures;
	
	private String address;
	
	private String placeid;
	
	private Boolean isLocationPublic;
	
	private String email;
	
	private Boolean isEmailPublic;
	
	private Boolean isEmailVerified;
	
	private String phone;
	
	private Boolean isPhonePublic;
	
	private Boolean isPhoneVerified;
	
	private String description;
	
	private Boolean isDescriptionPublic;
	
	private String website;
	
	private Boolean isWebsitePublic;

}
