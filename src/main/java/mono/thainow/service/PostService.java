package mono.thainow.service;

import java.util.List;

import javax.validation.Valid;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.post.housing.HousingPost;
import mono.thainow.domain.post.job.JobPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.DealRequest;
import mono.thainow.rest.request.HousingRequest;
import mono.thainow.rest.request.JobRequest;

public interface PostService {

	List<Post> getPosts(Profile profile);
	
	DealPost getValidDealPost(Long postId);
	
	JobPost getValidJobPost(Long postId);
	
	HousingPost getValidHousingPost(Long postId);
	
	DealPost createPost(Profile owner, DealRequest request);

	JobPost createPost(Profile postOwner, @Valid JobRequest request);
	
	HousingPost createPost(Profile postOwner, @Valid HousingRequest request);

	void updatePost(DealPost dealPost, DealRequest request);

	void updatePost(JobPost jobPost, JobRequest request);
	
	void updatePost(HousingPost housingPost, HousingRequest request);
	
	DealPost activatePost(DealPost dealPost);
	
	JobPost activatePost(JobPost jobPost);

	HousingPost activatePost(HousingPost housingPost);
	
	void disablePost(List<Post> posts);
	
	void disablePost(DealPost dealPost);
	
	void disablePost(HousingPost housingPost);
	
	void disablePost(JobPost jobPost);
	
	void removePost(List<Post> posts);
	
	void removePost(DealPost dealPost);
	
	void removePost(JobPost jobPost);
	
	void removePost(HousingPost housingPost);
	
	Post savePost(Post post);

	

}
