package mono.thainow.dao;

import mono.thainow.domain.review.Review;

public interface ReviewDao {

	Review saveReview(Review newReview);

	Review findActiveReviewById(Long reviewId);
	
	void removeReview(Review review);

	
}
