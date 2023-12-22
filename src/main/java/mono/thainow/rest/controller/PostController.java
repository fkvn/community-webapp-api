package mono.thainow.rest.controller;

import com.fasterxml.jackson.annotation.JsonView;
import mono.thainow.annotation.AdminAndSAdminAccess;
import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.profile.Profile;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.rest.request.NewGuideBookPostRequest;
import mono.thainow.rest.request.PatchGuideBookPostRequest;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.service.AuthService;
import mono.thainow.service.PostService;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.view.View;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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

    @GetMapping("/{id}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @JsonView(View.Detail.class)
    public Post findPost(@PathVariable Long id) {

        Post post = postService.findPostById(id);

        UserDetailsImpl requesterAccount = authService.getAuthenticatedUser();

        boolean isAdmin = requesterAccount != null && requesterAccount.isAdmin();
        boolean isPostOwner = requesterAccount != null &&
                requesterAccount.getId().equals(post.getOwner().getAccount().getId());

        // anonymous and not authenticated only can see public post
        if (!isAdmin && !isPostOwner && post.getStatus() != PostStatus.PUBLIC)
            throw new AccessForbidden();

        // only admin can view the disabled post
        if (!isAdmin && post.getStatus() == PostStatus.DISABLED) throw new AccessForbidden();

        return post;
    }

    @PostMapping("/guidebooks")
    @ResponseStatus(HttpStatus.CREATED)
    //    @CreateGuideBookAccess
    public Long createGuideBookPost(@NotNull @RequestParam Long profileId,
                                    @Valid @RequestBody NewGuideBookPostRequest request) {

        request.setPostType(PostType.GUIDEBOOK_POST);
        return createPostFromRequest(profileId, request);
    }

    //	Helper
    private Long createPostFromRequest(Long profileId, PostRequest request) {

        Profile requesterProfile = authService.getAuthorizedProfile(profileId, true);

        Post newPost = postService.createPost(requesterProfile, request);

        return newPost.getId();
    }

    @PatchMapping("/guidebooks/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AuthenticatedAccess
    public void PatchGuideBookPost(@PathVariable Long id, @NotNull @RequestParam Long profileId,
                                   @Valid @RequestBody PatchGuideBookPostRequest request) {

        request.setPostType(PostType.GUIDEBOOK_POST);
        patchPostFromRequest(id, profileId, request);
    }

    //	Helper
    private void patchPostFromRequest(Long postId, Long profileId, PostRequest request) {

        Post post = postService.findPostById(postId);

        // only owner or admin can edit post
        Profile requesterProfile = authService.getAuthorizedProfile(profileId, false);

        if (requesterProfile == null) throw new AccessForbidden();

        // only admin can edit the DISABLED POST
        if (!requesterProfile.getAccount().isAdmin() && post.getStatus() == PostStatus.DISABLED)
            throw new AccessForbidden();

        postService.patchPost(post, request);
    }


    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AuthenticatedAccess
    public void deletePost(@PathVariable Long id,
                           @RequestParam(defaultValue = "false") Boolean isHardDelete) {

        Post post = postService.findPostById(id);
        UserDetailsImpl requesterAccount = authService.getAuthenticatedUser();

        // only admin or post owner can be authorized
        if (!requesterAccount.isAdmin() &&
                !post.getOwner().getAccount().getId().equals(requesterAccount.getId()))
            throw new AccessForbidden();

        // only admin can do hard delete
        if (isHardDelete && requesterAccount.isAdmin()) postService.deletePost(post);

            // post owner can do soft delete
        else postService.removePost(post);

    }

    @PostMapping("/{id}/activation")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AdminAndSAdminAccess
    public void activatePost(@PathVariable Long id) {
        Post post = postService.findPostById(id);
        postService.activatePost(post);
    }

    @DeleteMapping("/{id}/activation")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AdminAndSAdminAccess
    public void disablePost(@PathVariable Long id) {
        Post post = postService.findPostById(id);
        postService.disablePost(post);
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


    //    // get the latest modifier
    //    AuditReader reader = AuditReaderFactory.get(entityManager);
    //
    //    //Here you find the revision number that you want
    //
    //    AuditQuery queryHistoryOfUserWithRev =
    //            reader.createQuery().forRevisionsOfEntity(GuideBook.class, false, false)
    //                    .addProjection(AuditEntity.revisionNumber().max())
    //                    .add(AuditEntity.property("id").eq(Long.valueOf(182)));
    //    List lstHistoryOfUserWithRev = queryHistoryOfUserWithRev.getResultList();
    //
    //        for (Object item : lstHistoryOfUserWithRev) {
    //
    //        //DefaultRevisionEntity revisionEntity = (DefaultRevisionEntity) ((Object[]) item)[1];
    //        MyRevisionEntity revisionEntity = (MyRevisionEntity) ((Object[]) item)[1];
    //        RevisionType revisionType = (RevisionType) ((Object[]) item)[2];
    //        System.out.printf(revisionEntity.getModifierUser());
    //        System.out.printf("revType: {}%n", revisionType);
    //    }
}
