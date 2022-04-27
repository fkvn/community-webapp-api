package mono.thainow.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.domain.post.Post;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.rest.response.PostResponse;
import mono.thainow.service.PostService;

@RestController
//@PreAuthorize("hasAnyAuthority('ALL_POST_MANAGE')")
@RequestMapping("/api/posts")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	
	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<PostResponse> getAllPosts() {
		return postService.getAllPosts();
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public PostResponse createPost(@RequestBody PostRequest postRequest) {
		
		Post newPost = postService.createPost(postRequest);
		
		PostResponse postReq = postService.getPostResponse(newPost);
		
		return postReq;
	}
	
	
	@GetMapping("/{id}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public PostResponse getPost(@PathVariable Long id) {
		
		Post post = postService.getPostById(id);
		
		PostResponse postReq = postService.getPostResponse(post);
		
		return postReq;
	}
	
	
	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void softDeletePost(@PathVariable Long id) {
		
		Post post = postService.getPostById(id);
		
		postService.softDeletePost(post);
	}
	
}
