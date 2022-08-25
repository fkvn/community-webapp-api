package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.PostRequest;

public interface PostService {
	
	List<Post> getPosts(Profile profile);

	void removePosts(List<Post> posts);
	
	void disablePost(List<Post> posts);
	
//	============================================
	
	Post getValidPost(Long postId, PostType type);

	Post activatePost(Post post);

	Post createPost(Profile owner, PostRequest request);

	void updatePost(Post post, Object request);
	
	void disablePost(Post post);

	void removePost(Post post);
	
	Post savePost(Post post);

}
