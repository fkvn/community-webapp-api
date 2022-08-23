package mono.thainow.service;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.DealRequest;

public interface PostService {

	DealPost createPost(Profile owner, DealRequest request);
	
	Post savePost(Post post);

	DealPost getValidDealPost(Long postId);

	void updatePost(DealPost dealPost, DealRequest request);

}
