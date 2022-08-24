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
import mono.thainow.domain.post.job.JobPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.JobRequest;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.UserService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
@RequestMapping("/api/posts/jobs")
public class JobPostController {

	@Autowired
	UserService userService;

	@Autowired
	PostService postService;

	@Autowired
	ProfileService profileService;

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	@AuthenticatedAccess
	public Long createJob(@Valid @RequestBody JobRequest request) {

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, true);

		JobPost job = postService.createPost(postOwner, request);

		return job.getId();
	}

	@GetMapping("/{postId}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Detail.class)
	public JobPost getJob(@PathVariable Long postId, @RequestParam(required = false) Long profileId) {

		JobPost jobPost = postService.getValidJobPost(postId);

		Profile postOwner = profileService.getProfile(profileId);

		if (jobPost.getStatus() == PostStatus.PRIVATE) {
			AuthUtil.authorizedAccess(postOwner, jobPost, true);
		}

		return jobPost;

	}

	@PatchMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void updateJob(@PathVariable Long postId, @RequestBody JobRequest request) {

		JobPost jobPost = postService.getValidJobPost(postId);

		Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
		Assert.isTrue(profileId != null, "Missing profile information!");

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, jobPost, true);

		postService.updatePost(jobPost, request);

	}

	@DeleteMapping("/{postId}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AuthenticatedAccess
	public void removeJob(@PathVariable Long postId, @RequestParam Long profileId) {

		JobPost jobPost = postService.getValidJobPost(postId);

		Profile postOwner = profileService.getProfile(profileId);

		AuthUtil.authorizedAccess(postOwner, jobPost, true);

		postService.removePost(jobPost);

	}
	
	@PatchMapping("/{postId}/activate")
	@ResponseStatus(HttpStatus.OK)
	@AdminAndSAdminAccess
	public JobPost activateJob(@PathVariable Long postId) {

		JobPost jobPost = postService.getValidJobPost(postId);
		
		return postService.activatePost(jobPost);
	}

	@PatchMapping("/{postId}/disable")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void disableJob(@PathVariable Long postId) {

		JobPost jobPost = postService.getValidJobPost(postId);

		postService.disablePost(jobPost);

	}

}
