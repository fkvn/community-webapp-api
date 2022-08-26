package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.location.Location;

@Getter
public class SearchRequest {

	private String keywords = "";

	private int limit = 20;

	private int page = 0;
	
	private Location center;

}
