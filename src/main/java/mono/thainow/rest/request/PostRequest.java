package mono.thainow.rest.request;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.location.Location;

@Getter
@Setter
public class PostRequest {
	
	@NotEmpty
	private String title;
	
	private String description;
	
	private String status;
	
	@NotNull
	private Location location; 
	
	private boolean isCompanyPost;
	
	private Long CompanyId;
	
	private Long authorId;
	
}
