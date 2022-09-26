package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoogleRequest {
	
	private String sub;
	
	private String email;
	
	private Boolean isEmailVerified;

	private String name;
	
	private String picture;
	
	private String given_name;
	
	private String family_name;

}
