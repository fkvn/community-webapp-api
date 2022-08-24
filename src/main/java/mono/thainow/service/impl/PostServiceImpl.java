package mono.thainow.service.impl;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.PostDao;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.deal.Deal;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.post.housing.Housing;
import mono.thainow.domain.post.housing.HousingPost;
import mono.thainow.domain.post.job.Job;
import mono.thainow.domain.post.job.JobPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.DealRequest;
import mono.thainow.rest.request.HousingRequest;
import mono.thainow.rest.request.JobRequest;
import mono.thainow.service.DealService;
import mono.thainow.service.HousingService;
import mono.thainow.service.JobService;
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
	
	@Override
	public DealPost createPost(Profile owner, DealRequest request) {

		Deal deal = dealService.createDeal(request);

		DealPost dealPost = new DealPost(owner, deal);
		dealPost = (DealPost) savePost(dealPost);

		return dealPost;
	}

	@Override
	public Post savePost(Post post) {
		return postDao.savePost(post);
	}

	@Override
	public DealPost getValidDealPost(Long postId) {
		return postDao.getValidDealPost(postId);
	}

	@Override
	public void updatePost(DealPost dealPost, DealRequest request) {

		Deal deal = dealService.getDealFromUpdateRequest(dealPost.getDeal(), request);

		dealService.saveDeal(deal);

	}

	@Override
	public void removePost(DealPost dealPost) {

//		remove deal
		dealService.remove(dealPost.getDeal());

//		delete deal post
		postDao.deletePost(dealPost.getId());

	}

	@Override
	public void disablePost(DealPost dealPost) {

		Deal deal = dealPost.getDeal();

		deal.setStatus(PostStatus.DISABLED);

		dealService.saveDeal(deal);

	}

	@Override
	public DealPost activatePost(DealPost dealPost) {

		Deal deal = dealPost.getDeal();

		deal.setStatus(PostStatus.PRIVATE);

		dealService.saveDeal(deal);

		return dealPost;
	}

	@Override
	public List<Post> getPosts(Profile profile) {
		return postDao.getPosts(profile);
	}

	@Override
	public void disablePost(List<Post> posts) {

		posts.forEach(post -> {
			switch (post.getType()) {
			case "DEAL_POST":
				disablePost((DealPost) post);
				break;
			default:
				break;
			}

		});
	}

	@Override
	public void removePost(List<Post> posts) {
		posts.forEach(post -> {
			switch (post.getType()) {
			case "DEAL_POST":
				removePost((DealPost) post);
				break;
			default:
				break;
			}
		});
	}

	@Override
	public JobPost createPost(Profile postOwner, @Valid JobRequest request) {
		Job job = jobService.createJob(request);

		JobPost jobPost = new JobPost(postOwner, job);
		jobPost = (JobPost) savePost(jobPost);

		return jobPost;
	}

	@Override
	public JobPost getValidJobPost(Long postId) {
		return postDao.getValidJobPost(postId);
	}

	@Override
	public void updatePost(JobPost jobPost, JobRequest request) {
		Job job = jobService.getJobFromUpdateRequest(jobPost.getJob(), request);

		jobService.saveJob(job);
	}

	@Override
	public void removePost(JobPost jobPost) {
//		remove job
		jobService.remove(jobPost.getJob());

//		delete job post
		postDao.deletePost(jobPost.getId());
	}

	@Override
	public JobPost activatePost(JobPost jobPost) {
		Job job = jobPost.getJob();

		job.setStatus(PostStatus.PRIVATE);

		jobService.saveJob(job);

		return jobPost;
	}

	@Override
	public void disablePost(JobPost jobPost) {
		Job job = jobPost.getJob();

		job.setStatus(PostStatus.DISABLED);

		jobService.saveJob(job);
	}

	@Override
	public HousingPost createPost(Profile postOwner, @Valid HousingRequest request) {
		Housing housing = housingService.createHousing(request);

		HousingPost housingPost = new HousingPost(postOwner, housing);
		housingPost = (HousingPost) savePost(housingPost);

		return housingPost;
	}

	@Override
	public HousingPost getValidHousingPost(Long postId) {
		return postDao.getValidHousingPost(postId);
	}

	@Override
	public void updatePost(HousingPost housingPost, HousingRequest request) {
		Housing housing = housingService.getHousingFromUpdateRequest(housingPost.getHousing(), request);

		housingService.saveHousing(housing);
		
	}

	@Override
	public void removePost(HousingPost housingPost) {
//		remove housing
		housingService.remove(housingPost.getHousing());

//		delete deal post
		postDao.deletePost(housingPost.getId());
		
	}

	@Override
	public HousingPost activatePost(HousingPost housingPost) {
		Housing housing = housingPost.getHousing();

		housing.setStatus(PostStatus.PRIVATE);

		housingService.saveHousing(housing);

		return housingPost;
	}

	@Override
	public void disablePost(HousingPost housingPost) {
		Housing housing = housingPost.getHousing();

		housing.setStatus(PostStatus.DISABLED);

		housingService.saveHousing(housing);
	}

}
