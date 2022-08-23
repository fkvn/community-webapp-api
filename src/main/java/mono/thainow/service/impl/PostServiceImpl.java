package mono.thainow.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.PostDao;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.deal.Deal;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.profile.Profile;
import mono.thainow.rest.request.DealRequest;
import mono.thainow.service.DealService;
import mono.thainow.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;
	
	@Autowired
	private DealService dealService;

	@Override
	public DealPost createPost(Profile owner, DealRequest request) {
		
		Deal deal = dealService.createDeal(request);
		
		DealPost dealPost = new DealPost(owner, deal);
		dealPost = (DealPost) savePost(dealPost);
		

		return dealPost;
	}

	@Override
	public Post savePost(Post post) {
		return postDao.savePost(post);
	}

	@Override
	public DealPost getValidDealPost(Long postId) {
		return postDao.getValidDealPost(postId);
	}

	@Override
	public void updatePost(DealPost dealPost, DealRequest request) {
		
		Deal deal = dealService.getDealFromUpdateRequest(dealPost.getDeal(), request);
		
		dealService.saveDeal(deal);
		
	}








}
