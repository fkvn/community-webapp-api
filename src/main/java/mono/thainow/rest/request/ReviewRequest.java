package mono.thainow.rest.request;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.review.ReviewType;

@Getter
public class ReviewRequest {
	
	private Long reviewerId;
	
	@JsonIgnore
	@Setter
	private ReviewType type;
	
	private Long postReviewId;
	
	private Long profileReviewId;
	
	private int rate;
	
	private String comment;

}
