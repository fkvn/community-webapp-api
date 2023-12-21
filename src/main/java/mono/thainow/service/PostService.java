package mono.thainow.service;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.PostRequest;

import java.util.List;

public interface PostService {

    List<Post> findPostsByProfile(Profile profile);

    Post findPostById(Long postId);

    //	============================================

    void activatePost(Post post);

    Post createPost(Profile owner, PostRequest request);

    void patchPost(Post post, PostRequest request);

    void disablePost(Post post);

    void removePost(Post post);

    void deletePost(Post post);

    Post savePost(Post post);


}
