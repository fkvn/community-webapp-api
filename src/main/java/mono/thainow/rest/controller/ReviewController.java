package mono.thainow.rest.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.review.ReviewType;
import mono.thainow.rest.request.ReviewRequest;
import mono.thainow.service.ProfileService;
import mono.thainow.service.ReviewService;
import mono.thainow.util.AuthUtil;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {

	@Autowired
	ReviewService reviewService;

	@Autowired
	ProfileService profileService;

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createPostReview(@Valid @RequestBody ReviewRequest request) {

		Long profileId = Optional.ofNullable(request.getReviewerId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		ReviewType type = Optional.ofNullable(request.getType()).orElse(null);
		
		Assert.isTrue(type != null && (type == ReviewType.POST_REVIEW || type == ReviewType.PROFILE_REVIEW),
				"Invalid Review Type!");

		Profile reviewer = profileService.getProfile(profileId);
		AuthUtil.authorizedAccess(reviewer, true);

		Review newReview = reviewService.createReview(reviewer, request);

		return newReview.getId();

	}

	@PatchMapping("/{reviewId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateReview(@PathVariable Long reviewId, @Valid @RequestBody ReviewRequest request) {

		Long profileId = Optional.ofNullable(request.getReviewerId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile reviewer = profileService.getProfile(profileId);

		Review review = reviewService.getValidReview(reviewId);

		AuthUtil.authorizedAccess(reviewer, review, true);

		reviewService.updateReview(review, request);
	}

}
