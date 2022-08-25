package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.profile.Profile;

public interface PostDao {

	public List<Post> getPosts(Profile profile);

	public Post getPost(long id);

	public Post getValidPost(Long postId, PostType type);

	public Post savePost(Post post);

	public void deletePost(long id);

	public List<Post> getPosts(Profile postOwner, PostType postType);
}
