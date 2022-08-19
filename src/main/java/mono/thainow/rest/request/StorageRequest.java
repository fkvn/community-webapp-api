package mono.thainow.rest.request;

import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter

public class StorageRequest {
	

	private String name = null;
	

	private String type = null;
	
	@NotEmpty
	private String url;
	
	private Long size = null;
	
}
