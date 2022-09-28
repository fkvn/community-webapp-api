package mono.thainow.service;

import javax.validation.Valid;

import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.Review;
import mono.thainow.rest.request.ReviewRequest;

public interface ReviewService {

	Review createReview(Profile reviewer, ReviewRequest request);

	Review fetchReviewFromRequest(Review review, ReviewRequest request);
	
	Review fetchReviewFromUpdateRequest(Review review, ReviewRequest request);

	Review saveReview(Review newReview);

	Review findActiveReviewById(Long reviewId);

	void updateReview(Review review, @Valid ReviewRequest request);
}
