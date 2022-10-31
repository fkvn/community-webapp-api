package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.profile.Profile;

public interface PostDao {

	public List<Post> findPostsByProfile(Profile profile);

	public Post findPostById(long id);

	public Post findValidPost(Long postId, PostType type);

	public Post savePost(Post post);

	public void deletePostById(long id);
	
	public void deletePost(Post post);

//	public List<Post> getPosts(Profile postOwner, PostType postType, String sort, int page, int limit, boolean ownerRequest);

//	public Post getPost(PostType type, Object entity);

}
