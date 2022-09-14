package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.review.ReviewType;

@Getter
public class ReviewRequest {
	
	private Long reviewerId;
	
	private ReviewType type;
	
	private Long postId;
	
	private Long profileId;
	
	private int rate;
	
	private String comment;

}
