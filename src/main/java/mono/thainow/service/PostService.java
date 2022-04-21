package mono.thainow.service;

import java.util.List;

import mono.thainow.domain.post.Post;
import mono.thainow.rest.request.PostRequest;

public interface PostService {

	Long createPost(PostRequest postRequest);

	List<Post> getAllPosts();
}
