package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.deal.DealPost;

public interface PostDao {

	public Post getPost(long id);

	public Post savePost(Post post);

	public void removePost(long id);

	public List<Post> getAllPosts();

	public DealPost getValidDealPost(Long postId);
}
