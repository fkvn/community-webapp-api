package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.post.PostType;

@Getter
public class PostRequest {
	
	private Long profileId;
	
	@Setter
	private PostType postType;
	
}
