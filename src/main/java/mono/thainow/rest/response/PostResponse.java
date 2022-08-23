package mono.thainow.rest.response;

import java.util.Date;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.post.PostStatus;

@Getter
@Setter
public class PostResponse {

	private Long id;
	
	private String description;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createdOn;
	
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date updatedOn;
	
	private PostStatus status;
	
	private Location location;
	
	private Map<String, Object> author;
	
	private Map<String, Object> postInfo;
	
	
}
