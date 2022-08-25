package mono.thainow.rest.controller;

import java.util.Optional;

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
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.DealRequest;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.UserService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
@RequestMapping("/api/posts/deals")
public class DealPostController {

	@Autowired
	UserService userService;

	@Autowired
	PostService postService;

	@Autowired
	ProfileService profileService;

//	@PostMapping
//	@ResponseStatus(HttpStatus.CREATED)
//	@AuthenticatedAccess
//	public Long createDeal(@Valid @RequestBody DealRequest request) {
//
//		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
//		Assert.isTrue(profileId != null, "Missing profile information!");
//
//		Profile postOwner = profileService.getProfile(profileId);
//
//		AuthUtil.authorizedAccess(postOwner, true);
//
//		Post newPost = postService.createPost(postOwner, PostType.DEAL_POST, request);
//
//		return newPost.getId();
//	}

	@GetMapping("/{postId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public Post getDeal(@PathVariable Long postId, @RequestParam(required = false) Long profileId) {

		DealPost dealPost = (DealPost) postService.getValidPost(postId, PostType.DEAL_POST);

		Profile postOwner = profileService.getProfile(profileId);

		if (dealPost.getStatus() == PostStatus.PRIVATE) {
			AuthUtil.authorizedAccess(postOwner, dealPost, true);
		}

		return dealPost;

	}

	@PatchMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateDeal(@PathVariable Long postId, @RequestBody DealRequest request) {

		DealPost dealPost = (DealPost) postService.getValidPost(postId, PostType.DEAL_POST);

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, dealPost, true);

		postService.updatePost(dealPost, request);

	}

	@DeleteMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void removeDeal(@PathVariable Long postId, @RequestParam Long profileId) {

		DealPost dealPost = (DealPost) postService.getValidPost(postId, PostType.DEAL_POST);

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, dealPost, true);

		postService.removePost(dealPost);

	}
	
	@PatchMapping("/{postId}/activate")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	public Post activateDeal(@PathVariable Long postId) {

		DealPost dealPost = (DealPost) postService.getValidPost(postId, PostType.DEAL_POST);
		
		return postService.activatePost(dealPost);
	}

	@PatchMapping("/{postId}/disable")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void disableDeal(@PathVariable Long postId) {

		DealPost dealPost = (DealPost) postService.getValidPost(postId, PostType.DEAL_POST);

		postService.disablePost(dealPost);

	}

}