package mono.thainow.rest.request;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StorageRequest {
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	private String type;
	
	@NotEmpty
	private String url;
	
	@NotNull
	private Long size;
	
}
