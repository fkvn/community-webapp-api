package mono.thainow.rest.controller;

import com.fasterxml.jackson.annotation.JsonView;
import mono.thainow.annotation.AdminAndSAdminAccess;
import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.profile.Profile;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.GuideBookRequest;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.service.AuthService;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.view.View;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

@RestController
@RequestMapping("/api/posts")
public class PostController {

    @Autowired
    AuthService authService;

    @Autowired
    PostService postService;

    @Autowired
    ProfileService profileService;

    @GetMapping("/{postId}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @JsonView(View.Detail.class)
    public Post findPost(@PathVariable Long postId,
                         @RequestParam(defaultValue = "-1") Long profileId,
                         @RequestParam PostType type) throws AccessForbidden {

        if (authService.isAdminAuthenticated()) {
            return postService.findPostById(postId);
        }

        Post post = postService.findValidPost(postId, type);

        Profile requester = null;

        if (profileId >= 0) {
            requester = profileService.findProfileById(profileId);
            Assert.isTrue(!post.getBlockers().contains(requester),
                    "You have blocked this post in the past. Contact the administrator if you " +
                            "need other helps!");
        }

        if (post.getStatus() == PostStatus.PRIVATE) {
            if (requester == null) throw new AccessForbidden();
            authService.getAuthorizedProfile(requester, post, true);
        }

        return post;
    }


    //	@GetMapping
    //	@ResponseStatus(HttpStatus.OK)
    //	@JsonView(View.Basic.class)
    //	public List<Post> getPosts(@RequestParam Long profileId, @RequestParam PostType postType,
    //			@RequestParam(defaultValue = "Date") String sort, @RequestParam(defaultValue =
    //			"1") int page,
    //			@RequestParam(defaultValue = "20") int limit) {
    //
    //		Profile postOwner = profileService.findProfileById(profileId);
    //
    //		boolean ownerRequest = AuthUtil.getAuthenticatedUser() != null && AuthUtil
    //		.authorizedAccess(postOwner, false);
    //
    //		return postService.getPosts(postOwner, postType, sort, page, limit, ownerRequest);
    //
    //	}

    //	Helper
    private Long createPostFromRequest(Long profileId, PostRequest request) {

        Profile requesterProfile = authService.getAuthorizedProfile(profileId, true);

        Post newPost = postService.createPost(requesterProfile, request);

        return newPost.getId();
    }

    @PostMapping("/guidebooks")
    @ResponseStatus(HttpStatus.CREATED)
    //    @ContributorAccess
    public Long createGuideBookPost(@NotNull @RequestParam Long profileId,
                                    @Valid @RequestBody GuideBookRequest request) {

        request.isPostAsAnonymous();
        request.getNotificationVia();

        return null;

    }

    //    @PostMapping("/deals")
    //    @ResponseStatus(HttpStatus.CREATED)
    //    @AuthenticatedAccess
    //    public Long createDealPost(@Valid @RequestBody DealRequest request) {
    //        request.setPostType(PostType.DEAL_POST);
    //        return createPostFromRequest(request);
    //    }
    //
    //
    //    @PostMapping("/jobs")
    //    @ResponseStatus(HttpStatus.CREATED)
    //    @AuthenticatedAccess
    //    public Long createJobPost(@Valid @RequestBody JobRequest request) {
    //        request.setPostType(PostType.JOB_POST);
    //        return createPostFromRequest(request);
    //    }
    //
    //    @PostMapping("/housings")
    //    @ResponseStatus(HttpStatus.CREATED)
    //    @AuthenticatedAccess
    //    public Long createHousingPost(@Valid @RequestBody HousingRequest request) {
    //        request.setPostType(PostType.HOUSING_POST);
    //        return createPostFromRequest(request);
    //    }
    //
    //    @PostMapping("/marketplaces")
    //    @ResponseStatus(HttpStatus.CREATED)
    //    @AuthenticatedAccess
    //    public Long createMarketplacePost(@Valid @RequestBody MarketplaceRequest request) {
    //        request.setPostType(PostType.MARKETPLACE_POST);
    //        return createPostFromRequest(request);
    //    }

    //	Helper
    //    private void updatePostFromRequest(Long postId, PostRequest request) {
    //
    //        Long profileId = Optional.ofNullable(request.getProfileId()).orElse(null);
    //        if (profileId == null) profileId = authService.getAuthenticatedUser().getId();
    //        if (profileId == null) throw new AccessForbidden();
    //
    //        Profile postOwner = profileService.findProfileById(profileId);
    //
    //        PostType type = Optional.ofNullable(request.getPostType()).orElse(null);
    //        Assert.isTrue(type != null, "Invalid Post Type!");
    //
    //        //		valid post includes either available or private post
    //        Post post = postService.findValidPost(postId, type);
    //
    //        authService.getAuthorizedProfile(postOwner, post, true);
    //
    //        postService.updatePost(post, request);
    //    }

    //    @PatchMapping("/deals/{postId}")
    //    @ResponseStatus(HttpStatus.NO_CONTENT)
    //    @AuthenticatedAccess
    //    public void updateDeal(@PathVariable Long postId, @Valid @RequestBody DealRequest
    //    request) {
    //        request.setPostType(PostType.DEAL_POST);
    //        updatePostFromRequest(postId, request);
    //    }
    //
    //
    //    @PatchMapping("/jobs/{postId}")
    //    @ResponseStatus(HttpStatus.NO_CONTENT)
    //    @AuthenticatedAccess
    //    public void updateJob(@PathVariable Long postId, @Valid @RequestBody JobRequest request) {
    //        request.setPostType(PostType.JOB_POST);
    //        updatePostFromRequest(postId, request);
    //    }
    //
    //    @PatchMapping("/housings/{postId}")
    //    @ResponseStatus(HttpStatus.NO_CONTENT)
    //    @AuthenticatedAccess
    //    public void updateHousing(@PathVariable Long postId,
    //                              @Valid @RequestBody HousingRequest request) {
    //        request.setPostType(PostType.HOUSING_POST);
    //        updatePostFromRequest(postId, request);
    //    }
    //
    //    @PatchMapping("/marketplaces/{postId}")
    //    @ResponseStatus(HttpStatus.NO_CONTENT)
    //    @AuthenticatedAccess
    //    public void updateMarketplace(@PathVariable Long postId,
    //                                  @Valid @RequestBody MarketplaceRequest request) {
    //        request.setPostType(PostType.MARKETPLACE_POST);
    //        updatePostFromRequest(postId, request);
    //    }

    @PatchMapping("/{postId}/disable")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AdminAndSAdminAccess
    public void disablePost(@PathVariable Long postId) {

        Post post = postService.findPostById(postId);

        postService.disablePost(post);

    }

    @PatchMapping("/{postId}/activate")
    @ResponseStatus(HttpStatus.OK)
    @AdminAndSAdminAccess
    @JsonView(View.Detail.class)
    public Post activatePost(@PathVariable Long postId) {

        Post post = postService.findPostById(postId);

        return postService.activatePost(post);
    }

    @DeleteMapping("/{postId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AuthenticatedAccess
    public void removePost(@PathVariable Long postId, @RequestParam Long profileId)
            throws AccessForbidden {

        Post post = postService.findPostById(postId);

        Profile postOwner = profileService.findProfileById(profileId);

        authService.getAuthorizedProfile(postOwner, post, true);

        postService.removePost(post);

    }
}
