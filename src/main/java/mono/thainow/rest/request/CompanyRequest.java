package mono.thainow.rest.request;

import java.util.List;

import lombok.Getter;

@Getter
public class CompanyRequest {
	
	private String name;
	
	private String industry;
	
	private Boolean isInformal;
	
	private String address;
	
	private String placeid;
	
	private List<StorageRequest> pictures;
	
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
