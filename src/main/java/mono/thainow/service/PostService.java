package mono.thainow.service;

import java.util.List;
import java.util.Map;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.user.BusinessUser;
import mono.thainow.domain.user.User;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.rest.response.PostResponse;

public interface PostService {

	List<PostResponse> getAllPosts();
	
	Post getPostById(Long id);

	Post initializePostByType(PostType type);

	Post getPostInfoFromPostRequest(PostRequest postRequest);

	Post validateCompanyPost(Post post, Long companyId, BusinessUser user, boolean isCompanyPost);
	
	Post getPostDetailInfoFromPostRequest(Post post, PostRequest postRequest, User user);
	
	Post getDealPostDetailInfoFromPostRequest(DealPost post, PostRequest postRequest);

	PostResponse getPostResponse(Post post);

	String getPostAuthorName(Post post);

	Map<String, Object> getPostAuthorInfo(Post post);

	Map<String, Object> getPostDetailInfo(Post post);

	Map<String, Object> getDealInfo(DealPost post);

//	==================================

	Post createPost(PostRequest postRequest);
	
	void softDeletePost(Post post);
	
	void removePost(Post post);

	Post savePost(Post post);
}
