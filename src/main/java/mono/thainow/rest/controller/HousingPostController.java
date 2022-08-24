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
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.housing.HousingPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.HousingRequest;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.UserService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
@RequestMapping("/api/posts/housings")
public class HousingPostController {

	@Autowired
	UserService userService;

	@Autowired
	PostService postService;

	@Autowired
	ProfileService profileService;

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createHousing(@Valid @RequestBody HousingRequest request) {

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, true);

		HousingPost housing = postService.createPost(postOwner, request);

		return housing.getId();
	}

	@GetMapping("/{postId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public HousingPost getHousing(@PathVariable Long postId, @RequestParam(required = false) Long profileId) {

		HousingPost housingPost = postService.getValidHousingPost(postId);

		Profile postOwner = profileService.getProfile(profileId);

		if (housingPost.getStatus() == PostStatus.PRIVATE) {
			AuthUtil.authorizedAccess(postOwner, housingPost, true);
		}

		return housingPost;

	}

	@PatchMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateHousing(@PathVariable Long postId, @RequestBody HousingRequest request) {

		HousingPost housingPost = postService.getValidHousingPost(postId);

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, housingPost, true);

		postService.updatePost(housingPost, request);

	}

	@DeleteMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void removeHousing(@PathVariable Long postId, @RequestParam Long profileId) {

		HousingPost housingPost = postService.getValidHousingPost(postId);

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, housingPost, true);

		postService.removePost(housingPost);

	}
	
	@PatchMapping("/{postId}/activate")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	public HousingPost activateHousing(@PathVariable Long postId) {

		HousingPost housingPost = postService.getValidHousingPost(postId);
		
		return postService.activatePost(housingPost);
	}

	@PatchMapping("/{postId}/disable")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void disableHousing(@PathVariable Long postId) {

		HousingPost housingPost = postService.getValidHousingPost(postId);

		postService.disablePost(housingPost);

	}

}
