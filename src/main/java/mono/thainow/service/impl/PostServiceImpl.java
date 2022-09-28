package mono.thainow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.PostDao;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.post.deal.Deal;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.post.housing.Housing;
import mono.thainow.domain.post.housing.HousingPost;
import mono.thainow.domain.post.job.Job;
import mono.thainow.domain.post.job.JobPost;
import mono.thainow.domain.post.marketplace.Marketplace;
import mono.thainow.domain.post.marketplace.MarketplacePost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.DealRequest;
import mono.thainow.rest.request.HousingRequest;
import mono.thainow.rest.request.JobRequest;
import mono.thainow.rest.request.MarketplaceRequest;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.service.DealService;
import mono.thainow.service.HousingService;
import mono.thainow.service.JobService;
import mono.thainow.service.MarketplaceService;
import mono.thainow.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;

	@Autowired
	private DealService dealService;

	@Autowired
	private JobService jobService;

	@Autowired
	private HousingService housingService;

	@Autowired
	private MarketplaceService marketplaceService;

//	=============================================================

	@Override
	public List<Post> findPostsByProfile(Profile profile) {
		return postDao.findPostsByProfile(profile);
	}

//	@Override
//	public List<Post> getPosts(Profile postOwner, PostType postType, String sort, int page, int limit, boolean ownerRequest) {
//		return postDao.getPosts(postOwner, postType, sort, page, limit, ownerRequest);
//	}

	@Override
	public void removePosts(List<Post> posts) {
		posts.forEach(post -> {
			removePost(post);
		});
	}

//	@Override
//	public void disablePost(List<Post> posts) {
//		posts.forEach(post -> {
//			disablePost(post);
//		});
//	}
//	=============================================================

	@Override
	public Post findPostById(Long postId) {
		return postDao.findPostById(postId);
	}

//	@Override
//	public Post getPost(PostType type, Object entity) {
//		return postDao.getPost(type, entity);
//	}

	@Override
	public Post findValidPost(Long postId, PostType type) {
		return postDao.findValidPost(postId, type);
	}

	@Override
	public Post createPost(Profile owner, PostRequest request) {

		Post newPost = null;

		switch (request.getPostType()) {
		case DEAL_POST: {
			Deal deal = dealService.createDeal((DealRequest) request);
			newPost = new DealPost(owner, deal);
		}
			break;
		case JOB_POST: {
			Job job = jobService.createJob((JobRequest) request);
			newPost = new JobPost(owner, job);
		}
			break;
		case HOUSING_POST: {
			Housing housing = housingService.createHousing((HousingRequest) request);
			newPost = new HousingPost(owner, housing);
		}
			break;
		case MARKETPLACE_POST: {
			Marketplace marketplace = marketplaceService.createMarketplace((MarketplaceRequest) request);
			newPost = new MarketplacePost(owner, marketplace);
		}
			break;
		default:
			break;
		}

		Assert.isTrue(newPost != null, "Failed to create new post!");

		newPost = savePost(newPost);

		return newPost;
	}

	@Override
	public void updatePost(Post post, Object request) {

		switch (post.getType()) {
		case DEAL_POST: {
			dealService.updateDeal(((DealPost) post).getDeal(), (DealRequest) request);
		}
			break;
		case JOB_POST: {
			jobService.updateJob(((JobPost) post).getJob(), (JobRequest) request);
		}
			break;
		case HOUSING_POST: {
			housingService.updateHousing(((HousingPost) post).getHousing(), (HousingRequest) request);
		}
			break;
		case MARKETPLACE_POST: {
			marketplaceService.updateMarketplace(((MarketplacePost) post).getMarketplace(),
					(MarketplaceRequest) request);
		}
			break;
		default:
			break;
		}

	}

	@Override
	public void removePost(Post post) {

//		remove related entity
		switch (post.getType()) {
		case DEAL_POST:
			dealService.removeDeal(((DealPost) post).getDeal());
			break;
		case JOB_POST:
			jobService.removeJob(((JobPost) post).getJob());
			break;
		case HOUSING_POST:
			housingService.removeHousing(((HousingPost) post).getHousing());
			break;
		case MARKETPLACE_POST:
			marketplaceService.removeMarketplace(((MarketplacePost) post).getMarketplace());
			break;
		default:
			break;
		}

//		delete post
		postDao.deletePostById(post.getId());

	}

	@Override
	public Post activatePost(Post post) {

		switch (post.getType()) {
		case DEAL_POST:
			dealService.activateDeal(((DealPost) post).getDeal());
			break;
		case JOB_POST:
			jobService.activateJob(((JobPost) post).getJob());
			break;
		case HOUSING_POST:
			housingService.activateHousing(((HousingPost) post).getHousing());
			break;
		case MARKETPLACE_POST:
			marketplaceService.activateMarketplace(((MarketplacePost) post).getMarketplace());
			break;
		default:
			break;
		}

		return post;
	}

	@Override
	public void disablePost(Post post) {

		switch (post.getType()) {
		case DEAL_POST: {
			dealService.disableDeal(((DealPost) post).getDeal());
		}
			break;
		case JOB_POST: {
			jobService.disableJob(((JobPost) post).getJob());
		}
			break;
		case HOUSING_POST: {
			housingService.disableHousing(((HousingPost) post).getHousing());
		}
			break;
		case MARKETPLACE_POST: {
			marketplaceService.disableMarketplace(((MarketplacePost) post).getMarketplace());
		}
			break;
		default:
			break;
		}

	}

	@Override
	public Post savePost(Post post) {
		return postDao.savePost(post);
	}

}
