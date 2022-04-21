package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.post.Post;

public interface PostDao {

	public Post getPost(long id);

	public Post savePost(Post post);

	public void removePost(long id);

	public List<Post> getAllPosts();
}
