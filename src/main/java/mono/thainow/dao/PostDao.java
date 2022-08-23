package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.profile.Profile;

public interface PostDao {

	public Post getPost(long id);

	public Post savePost(Post post);

	public void deletePost(long id);

	public List<Post> getAllPosts();

	public DealPost getValidDealPost(Long postId);

	public List<Post> getPosts(Profile profile);
}
