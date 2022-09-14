package mono.thainow.rest.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.annotation.AdminAndSAdminAccess;
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

//	updatePost Helper
	private void updatePostFromRequest(Long postId, PostRequest request) {

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		PostType type = Optional.ofNullable(request.getPostType()).orElse(null);
		Assert.isTrue(type != null, "Invalid Post Type!");

		Profile postOwner = profileService.getProfile(profileId);

		Post post = postService.getValidPost(postId, type);

		AuthUtil.authorizedAccess(postOwner, post, true);

		postService.updatePost(post, request);
	}

	@GetMapping
	@ResponseStatus(HttpStatus.OK)
	public List<Post> getPosts(@RequestParam Long profileId, @RequestParam PostType postType) {

		Profile postOwner = profileService.getProfile(profileId);

		List<Post> posts = postService.getPosts(postOwner, postType);

//		anonymousUser -> public request
		if (AuthUtil.getAuthenticatedUser() == null || !AuthUtil.authorizedAccess(postOwner, false)) {
			posts = posts.stream().filter(post -> post.getStatus() == PostStatus.AVAILABLE)
					.collect(Collectors.toList());
		}

		return posts;

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
		request.setPostType(PostType.DEAL_POST);
		return createPostFromRequest(request);
	}

	@PostMapping("/jobs")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createJobPost(@Valid @RequestBody JobRequest request) {
		request.setPostType(PostType.JOB_POST);
		return createPostFromRequest(request);
	}

	@PostMapping("/housings")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createHousingPost(@Valid @RequestBody HousingRequest request) {
		request.setPostType(PostType.HOUSING_POST);
		return createPostFromRequest(request);
	}

	@PostMapping("/marketplaces")
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createMarketplacePost(@Valid @RequestBody MarketplaceRequest request) {
		request.setPostType(PostType.MARKETPLACE_POST);
		return createPostFromRequest(request);
	}

	@PatchMapping("/deals/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateDeal(@PathVariable Long postId, @Valid @RequestBody DealRequest request) {
		request.setPostType(PostType.DEAL_POST);
		updatePostFromRequest(postId, request);
	}

	@PatchMapping("/jobs/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateJob(@PathVariable Long postId, @Valid @RequestBody JobRequest request) {
		request.setPostType(PostType.JOB_POST);
		updatePostFromRequest(postId, request);
	}

	@PatchMapping("/housings/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateHousing(@PathVariable Long postId, @Valid @RequestBody HousingRequest request) {
		request.setPostType(PostType.HOUSING_POST);
		updatePostFromRequest(postId, request);
	}

	@PatchMapping("/marketplaces/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateMarketplace(@PathVariable Long postId, @Valid @RequestBody MarketplaceRequest request) {
		request.setPostType(PostType.MARKETPLACE_POST);
		updatePostFromRequest(postId, request);
	}

	@PatchMapping("/{postId}/disable")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void disablePost(@PathVariable Long postId) {

		Post post = postService.getPost(postId);

		postService.disablePost(post);

	}

	@PatchMapping("/{postId}/activate")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	@JsonView(View.Detail.class)
	public Post activateDeal(@PathVariable Long postId) {

		Post post = postService.getPost(postId);

		return postService.activatePost(post);
	}

	@DeleteMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void removeDeal(@PathVariable Long postId, @RequestParam Long profileId) {

		Post post = postService.getPost(postId);

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, post, true);

		postService.removePost(post);

	}
}
