package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.post.housing.HousingPost;
import mono.thainow.domain.post.job.JobPost;
import mono.thainow.domain.profile.Profile;

public interface PostDao {

	public List<Post> getAllPosts();

	public List<Post> getPosts(Profile profile);
	
	public Post getPost(long id);
	
	public DealPost getValidDealPost(Long postId);

	public JobPost getValidJobPost(Long postId);

	public HousingPost getValidHousingPost(Long postId);
	
	public Post savePost(Post post);

	public void deletePost(long id);
}
