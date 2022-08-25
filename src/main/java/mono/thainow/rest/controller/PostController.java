package mono.thainow.rest.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.DealRequest;
import mono.thainow.rest.request.HousingRequest;
import mono.thainow.rest.request.JobRequest;
import mono.thainow.rest.request.MarketplaceRequest;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
//@PreAuthorize("hasAnyAuthority('ALL_POST_MANAGE')")
@RequestMapping("/api/posts")
public class PostController {

	@Autowired
	PostService postService;

	@Autowired
	ProfileService profileService;

//	createPost Helper
	private Long createPostFromRequest(PostRequest request) {

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		PostType type = Optional.ofNullable(request.getPostType()).orElse(null);
		Assert.isTrue(type != null, "Invalid Post Type!");

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, true);

		Post newPost = postService.createPost(postOwner, request);

		return newPost.getId();
	}

	@GetMapping("/{postId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public Post getPost(@PathVariable Long postId, @RequestParam(required = false) Long profileId,
			@RequestParam PostType type) {

		Post post = postService.getValidPost(postId, type);

		Profile postOwner = profileService.getProfile(profileId);

		if (post.getStatus() == PostStatus.PRIVATE) {
			AuthUtil.authorizedAccess(postOwner, post, true);
		}

		return post;

	}

	@PostMapping("/deals")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createDealPost(@Valid @RequestBody DealRequest request) {
		return createPostFromRequest(request);
	}
	
	@PostMapping("/jobs")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createJobPost(@Valid @RequestBody JobRequest request) {
		return createPostFromRequest(request);
	}
	
	@PostMapping("/housings")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createHousingPost(@Valid @RequestBody HousingRequest request) {
		return createPostFromRequest(request);
	}
	
	@PostMapping("/marketplaces")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createMarketplacePost(@Valid @RequestBody MarketplaceRequest request) {
		return createPostFromRequest(request);
	}




}
