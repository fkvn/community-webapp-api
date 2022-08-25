package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.post.PostType;

@Getter
public class PostRequest {
	
	private Long profileId;
	
	private PostType postType;
	
}
