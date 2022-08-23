package mono.thainow.rest.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
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

import mono.thainow.annotation.AuthorizedAccess;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.DealRequest;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.UserService;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/posts/deals")
public class DealPostController {

	@Autowired
	UserService userService;

	@Autowired
	PostService postService;

	@Autowired
	ProfileService profileService;

	private boolean isPostOwner(DealPost deal, Profile postOwner, boolean throwError) {

		UserDetailsImpl userDetails = AuthUtil.getAuthorizedUser();

		boolean validRequester = userDetails != null && postOwner != null
				&& postOwner.getAccount().getId().equals(userDetails.getId());

		boolean validPostOwner = validRequester && deal != null && deal.getOwner().getId().equals(postOwner.getId());

		if (throwError && !validPostOwner) {
			throw new AccessForbidden();
		}

		return validPostOwner;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	@AuthorizedAccess
	public Long createPost(@Valid @RequestBody DealRequest request) {

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile postOwner = profileService.getProfile(profileId);

		DealPost deal = postService.createPost(postOwner, request);

		return deal.getId();
	}

	@GetMapping("/{postId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public DealPost getDeal(@PathVariable Long postId, @RequestParam(required = false) Long profileId) {

		DealPost deal = postService.getValidDealPost(postId);

		Profile postOwner = profileService.getProfile(profileId == null ? -1 : profileId);

		boolean anonymousUser = AuthUtil.getAuthorizedUser() == null || !isPostOwner(deal, postOwner, false);

		if (anonymousUser && deal.getStatus() == PostStatus.PRIVATE) {
			throw new AccessForbidden();
		}

		return deal;
	}

	@PatchMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void updateDeal(@PathVariable Long postId, @RequestBody DealRequest request) {

		DealPost deal = postService.getValidDealPost(postId);

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile postOwner = profileService.getProfile(profileId);

		isPostOwner(deal, postOwner, true);

		postService.updatePost(deal, request);

	}

}
