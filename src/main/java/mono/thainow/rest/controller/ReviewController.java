package mono.thainow.rest.controller;

import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.review.ReviewType;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.ReviewRequest;
import mono.thainow.service.AuthService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@RestController
@RequestMapping("/api/reviews")
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @Autowired
    ProfileService profileService;

    @Autowired
    AuthService authService;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    @AuthenticatedAccess
    public Long createPostReview(@Valid @RequestBody ReviewRequest request) throws AccessForbidden {

        Long reviewerId = Optional.ofNullable(request.getReviewerId()).orElse(null);
        Assert.isTrue(reviewerId != null, "Missing profile information!");

        ReviewType type = Optional.ofNullable(request.getType()).orElse(null);

        Assert.isTrue(type != null &&
                        (type == ReviewType.POST_REVIEW || type == ReviewType.PROFILE_REVIEW),
                "Invalid Review Type!");

        Profile reviewer = profileService.findProfileById(reviewerId);
        authService.getAuthorizedProfile(reviewer, true);

        Review newReview = reviewService.createReview(reviewer, request);

        return newReview.getId();

    }

    @PatchMapping("/{reviewId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AuthenticatedAccess
    public void updateReview(@PathVariable Long reviewId, @Valid @RequestBody ReviewRequest request)
            throws AccessForbidden {

        Long profileId = Optional.ofNullable(request.getReviewerId()).orElse(null);
        Assert.isTrue(profileId != null, "Missing profile information!");

        Profile reviewer = profileService.findProfileById(profileId);

        Review review = reviewService.findActiveReviewById(reviewId);

        authService.getAuthorizedProfile(reviewer, review, true);

        reviewService.updateReview(review, request);
    }

}
