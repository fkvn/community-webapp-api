package mono.thainow.rest.request;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserUpdateInfoRequest {

	private String username;
	
	private String firstname;
	
	private String lastname;
	
	private List<StorageRequest> coverPictures;
	
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
