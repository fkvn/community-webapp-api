package mono.thainow.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.domain.post.Post;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.service.PostService;

@RestController
//@PreAuthorize("hasAnyAuthority('ALL_POST_MANAGE')")
@RequestMapping("/api/posts")
public class PostController {
	
	@Autowired
	private PostService postService;
	
	
	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<Post> getAllPosts() {
		return postService.getAllPosts();
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Long createPost(@RequestBody PostRequest postRequest) {
		return postService.createPost(postRequest);
	}
	
}
