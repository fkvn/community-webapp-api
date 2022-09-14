package mono.thainow.service.impl;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.ReviewDao;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.PostReview;
import mono.thainow.domain.review.ProfileReview;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.review.ReviewStatus;
import mono.thainow.exception.BadRequest;
import mono.thainow.rest.request.ReviewRequest;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDao reviewDao;

	@Autowired
	PostService postService;

	@Autowired
	ProfileService profileService;

	@Override
	public Review createReview(Profile reviewer, ReviewRequest request) {

		Review review = null;

		switch (request.getType()) {
		case POST_REVIEW: {
			Long postReviewId = Optional.ofNullable(request.getPostId()).orElse(null);
			Assert.isTrue(postReviewId != null, "Invalid Reviewee");

			Post reviewee = postService.getPost(postReviewId);

			Assert.isTrue(!reviewee.getOwner().getId().equals(reviewer.getId()),
					"Post owner can't review their own posts!");

			review = new PostReview(reviewer, reviewee);

		}

			break;
		case PROFILE_REVIEW: {
			Long profileReviewId = Optional.ofNullable(request.getProfileId()).orElse(null);
			Assert.isTrue(profileReviewId != null, "Invalid Reviewee");

			Profile reviewee = profileService.getProfile(profileReviewId);
			Assert.isTrue(!reviewer.getAccount().getId().equals(reviewee.getAccount().getId()),
					"User can't review their own profiles!");

			review = new ProfileReview(reviewer, reviewee);

		}
			break;
		default:
			throw new BadRequest("Invalid Review Type!");
		}

		review = saveReview(getReviewFromRequest(review, request));

		return review;
	}

	@Override
	public Review saveReview(Review newReview) {
		return reviewDao.saveReview(newReview);
	}

	@Override
	public Review getReviewFromRequest(Review review, ReviewRequest request) {

//		rate
		int rate = Optional.ofNullable(request.getRate()).orElse(5);
		review.setRate(rate);

//		comment
		String comment = Optional.ofNullable(request.getComment()).orElse("");
		review.setComment(comment);

//		review status
		review.setStatus(ReviewStatus.ACTIVATED);

		return review;
	}

	@Override
	public Review getReviewFromUpdateRequest(Review review, ReviewRequest request) {

//		rate
		Integer rate = Optional.ofNullable(request.getRate()).orElse(null);
		if (rate != null) {
			review.setRate(rate);
		}

//		comment
		String comment = Optional.ofNullable(request.getComment()).orElse(null);
		if (comment != null) {
			review.setComment(comment);
		}

		return review;
	}

	@Override
	public Review getValidReview(Long reviewId) {
		return reviewDao.getValidReview(reviewId);
	}

	@Override
	public void updateReview(Review review, @Valid ReviewRequest request) {
		saveReview(getReviewFromUpdateRequest(review, request));
	}

//	@Autowired
//	private PostDao postDao;
//
//	@Autowired
//	private DealService dealService;
//
//	@Autowired
//	private JobService jobService;
//
//	@Autowired
//	private HousingService housingService;
//
//	@Autowired
//	private MarketplaceService marketplaceService;
//
////	=============================================================
//
//	@Override
//	public List<Post> getPosts(Profile profile) {
//		return postDao.getPosts(profile);
//	}
//
//	@Override
//	public List<Post> getPosts(Profile postOwner, PostType postType) {
//		return postDao.getPosts(postOwner, postType);
//	}
//
//	@Override
//	public void removePosts(List<Post> posts) {
//		posts.forEach(post -> {
//			removePost(post);
//		});
//	}
//
//	@Override
//	public void disablePost(List<Post> posts) {
//		posts.forEach(post -> {
//			disablePost(post);
//		});
//	}
////	=============================================================
//
//	@Override
//	public Post getPost(Long postId) {
//		return postDao.getPost(postId);
//	}
//
//	@Override
//	public Post getPost(PostType type, Object entity) {
//		return postDao.getPost(type, entity);
//	}
//
//	@Override
//	public Post getValidPost(Long postId, PostType type) {
//		return postDao.getValidPost(postId, type);
//	}
//
//	@Override
//	public Post createPost(Profile owner, PostRequest request) {
//
//		Post newPost = null;
//
//		switch (request.getPostType()) {
//		case DEAL_POST: {
//			Deal deal = dealService.createDeal((DealRequest) request);
//			newPost = new DealPost(owner, deal);
//		}
//			break;
//		case JOB_POST: {
//			Job job = jobService.createJob((JobRequest) request);
//			newPost = new JobPost(owner, job);
//		}
//			break;
//		case HOUSING_POST: {
//			Housing housing = housingService.createHousing((HousingRequest) request);
//			newPost = new HousingPost(owner, housing);
//		}
//			break;
//		case MARKETPLACE_POST: {
//			Marketplace marketplace = marketplaceService.createMarketplace((MarketplaceRequest) request);
//			newPost = new MarketplacePost(owner, marketplace);
//		}
//			break;
//		default:
//			break;
//		}
//
//		Assert.isTrue(newPost != null, "Failed to create new post!");
//
//		newPost = savePost(newPost);
//
//		return newPost;
//	}
//
//	@Override
//	public void updatePost(Post post, Object request) {
//
//		switch (post.getType()) {
//		case DEAL_POST: {
//			dealService.updateDeal(((DealPost) post).getDeal(), (DealRequest) request);
//		}
//			break;
//		case JOB_POST: {
//			jobService.updateJob(((JobPost) post).getJob(), (JobRequest) request);
//		}
//			break;
//		case HOUSING_POST: {
//			housingService.updateHousing(((HousingPost) post).getHousing(), (HousingRequest) request);
//		}
//			break;
//		case MARKETPLACE_POST: {
//			marketplaceService.updateMarketplace(((MarketplacePost) post).getMarketplace(),
//					(MarketplaceRequest) request);
//		}
//			break;
//		default:
//			break;
//		}
//
//	}
//
//	@Override
//	public void removePost(Post post) {
//
////		remove related entity
//		switch (post.getType()) {
//		case DEAL_POST:
//			dealService.remove(((DealPost) post).getDeal());
//			break;
//		case JOB_POST:
//			jobService.remove(((JobPost) post).getJob());
//			break;
//		case HOUSING_POST:
//			housingService.remove(((HousingPost) post).getHousing());
//			break;
//		case MARKETPLACE_POST:
//			marketplaceService.remove(((MarketplacePost) post).getMarketplace());
//			break;
//		default:
//			break;
//		}
//
////		delete post
//		postDao.deletePost(post.getId());
//
//	}
//
//	@Override
//	public Post activatePost(Post post) {
//
//		switch (post.getType()) {
//		case DEAL_POST:
//			dealService.activateDeal(((DealPost) post).getDeal());
//			break;
//		case JOB_POST:
//			jobService.activateJob(((JobPost) post).getJob());
//			break;
//		case HOUSING_POST:
//			housingService.activateHousing(((HousingPost) post).getHousing());
//			break;
//		case MARKETPLACE_POST:
//			marketplaceService.activateMarketplace(((MarketplacePost) post).getMarketplace());
//			break;
//		default:
//			break;
//		}
//
//		return post;
//	}
//
//	@Override
//	public void disablePost(Post post) {
//
//		switch (post.getType()) {
//		case DEAL_POST: {
//			dealService.disableDeal(((DealPost) post).getDeal());
//		}
//			break;
//		case JOB_POST: {
//			jobService.disableJob(((JobPost) post).getJob());
//		}
//			break;
//		case HOUSING_POST: {
//			housingService.disableHousing(((HousingPost) post).getHousing());
//		}
//			break;
//		case MARKETPLACE_POST: {
//			marketplaceService.disableMarketplace(((MarketplacePost) post).getMarketplace());
//		}
//			break;
//		default:
//			break;
//		}
//
//	}
//
//	@Override
//	public Post savePost(Post post) {
//		return postDao.savePost(post);
//	}

}
