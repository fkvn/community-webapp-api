package mono.thainow.rest.response;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StorageResponse {
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	private String type;
	
	@NotEmpty
	private String url;
	
	@NotNull
	private Long size;
	
}
