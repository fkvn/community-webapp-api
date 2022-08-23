package mono.thainow.rest.request;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CompanyRequest {
	
//	private String name;
//
//	private String industry;
//
//	private String email;
//
//	private String phone;
//
//	private boolean isInformal = false;
//
//	private String website;
//
//	private String address;
//
//	private String placeid;
	
	private String name;
	
	private String industry;
	
	private boolean isInformal = false;
	
	private String address;
	
	private String placeid;
	
	private List<StorageRequest> coverPictures;
	
	private String email;
	
	private Boolean isEmailPublic;
	
	private String phone;
	
	private Boolean isPhonePublic;
	
	private String description;
	
	private Boolean isDescriptionPublic;
	
	private String website;
	
	private Boolean isWebsitePublic;
	
	private String size;
	
	private Boolean isSizePublic;

}
