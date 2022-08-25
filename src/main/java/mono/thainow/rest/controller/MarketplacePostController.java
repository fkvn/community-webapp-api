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
import mono.thainow.domain.post.marketplace.MarketplacePost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.MarketplaceRequest;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.UserService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
@RequestMapping("/api/posts/marketplaces")
public class MarketplacePostController {

	@Autowired
	UserService userService;

	@Autowired
	PostService postService;

	@Autowired
	ProfileService profileService;

//	@PostMapping
//	@ResponseStatus(HttpStatus.CREATED)
//	@AuthenticatedAccess
//	public Long createMarketplace(@Valid @RequestBody MarketplaceRequest request) {
//
//		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
//		Assert.isTrue(profileId != null, "Missing profile information!");
//
//		Profile postOwner = profileService.getProfile(profileId);
//
//		AuthUtil.authorizedAccess(postOwner, true);
//
//		Post newPost = postService.createPost(postOwner, PostType.MARKETPLACE_POST, request);
//
//		return newPost.getId();
//	}

	@GetMapping("/{postId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public MarketplacePost getMarketplace(@PathVariable Long postId, @RequestParam(required = false) Long profileId) {

		MarketplacePost marketplacePost =(MarketplacePost) postService.getValidPost(postId, PostType.MARKETPLACE_POST);

		Profile postOwner = profileService.getProfile(profileId);

		if (marketplacePost.getStatus() == PostStatus.PRIVATE) {
			AuthUtil.authorizedAccess(postOwner, marketplacePost, true);
		}

		return marketplacePost;

	}

	@PatchMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateMarketplace(@PathVariable Long postId, @RequestBody MarketplaceRequest request) {

		MarketplacePost marketplacePost =(MarketplacePost) postService.getValidPost(postId, PostType.MARKETPLACE_POST);

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, marketplacePost, true);

		postService.updatePost(marketplacePost, request);

	}

	@DeleteMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void removeMarketplace(@PathVariable Long postId, @RequestParam Long profileId) {

		MarketplacePost marketplacePost =(MarketplacePost) postService.getValidPost(postId, PostType.MARKETPLACE_POST);

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, marketplacePost, true);

		postService.removePost(marketplacePost);

	}
	
	@PatchMapping("/{postId}/activate")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	public Post activateMarketplace(@PathVariable Long postId) {

		MarketplacePost marketplacePost =(MarketplacePost) postService.getValidPost(postId, PostType.MARKETPLACE_POST);
		
		return postService.activatePost(marketplacePost);
	}

	@PatchMapping("/{postId}/disable")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void disableMarketplace(@PathVariable Long postId) {

		MarketplacePost marketplacePost =(MarketplacePost) postService.getValidPost(postId, PostType.MARKETPLACE_POST);

		postService.disablePost(marketplacePost);

	}

}
