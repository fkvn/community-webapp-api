package mono.thainow.rest.request;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter

public class StorageRequest {
	

	private String name = "";
	

	private String type = "";
	
	@NotEmpty
	private String url;
	
	private Long size = (long) 0;
	
}
