package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CompanySignupRequest {

	private Long administratorId;
	
	private String name;

	private String industry;

	private String email;

	private String phone;

	private boolean isInformal = false;

	private String website;

	private String address;

	private String placeid;

}
