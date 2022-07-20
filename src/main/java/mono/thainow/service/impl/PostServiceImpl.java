package mono.thainow.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.PostDao;
import mono.thainow.dao.UserDao;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.post.deal.DealDiscountType;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.rest.request.PostRequest;
import mono.thainow.rest.response.PostResponse;
import mono.thainow.service.CompanyService;
import mono.thainow.service.LocationService;
import mono.thainow.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDao postDao;

	@Autowired
	private UserDao userDao;

	@Autowired
	private LocationService locationService;

	@Autowired
	private CompanyService companyService;

//	============================================================================
	
	@Override
	public List<PostResponse> getAllPosts() {

		List<Post> allPosts = postDao.getAllPosts();

		List<PostResponse> allPostReqs = allPosts.stream().map(post -> getPostResponse(post))
				.collect(Collectors.toList());

		return allPostReqs;
	}
	
	@Override
	public Post getPostById(Long id) {
		return postDao.getPost(id);
	}

	@Override
	public Post getPostInfoFromPostRequest(PostRequest postRequest) {
		Long authorId = Optional.ofNullable(postRequest.getAuthorId()).orElse(null);

//		assert that each post author is available
		Assert.isTrue(authorId != null, "Invalid Post Author!");

//		get post author info
		User user = userDao.getUserById(authorId);

//		create new post
		Post post = initializePostByType(PostType.valueOf(postRequest.getType()));

//		post author
		post.setAuthor(user);

//		post title
		String title = Optional.ofNullable(postRequest.getTitle()).orElse("");
		Assert.isTrue(!title.isEmpty(), "Title cannot be empty!");
		post.setTitle(title);

//		post description
		String description = Optional.ofNullable(postRequest.getDescription()).orElse("");
		post.setDescription(description);

//		post status
		String status = Optional.ofNullable(postRequest.getStatus()).orElse("");
		Assert.isTrue(!status.isEmpty(), "Status cannot be empty!");
		post.setStatus(PostStatus.valueOf(status));

//		post location
		Location location = locationService.getLocationFromPostRequest(postRequest);
		post.setLocation(location);

//		validate company post
		boolean isCompanyPost = Optional.ofNullable(postRequest.isCompanyPost()).orElse(false);
		Long companyId = Optional.ofNullable(postRequest.getCompanyId()).orElse(null);
//		post = validateCompanyPost(post, companyId, (BusinessUser) user, isCompanyPost);

//		post detail info
		post = getPostDetailInfoFromPostRequest(post, postRequest, user);
		
		return post;
	}

//	@Override
//	public Post validateCompanyPost(Post post, Long companyId, BusinessUser user, boolean isCompanyPost) {
//		
////		business need to be a company post
//		if (user.getRole()  == UserRole.BUSINESS) {
//			
//			Assert.isTrue(isCompanyPost, "Invalid Company Post Request!");
//
//			post.setCompanyPost(isCompanyPost);
//			
//			Company company = companyService.validateCompanyWithUserById(companyId, user);
//
////			assign company
//			post.setCompany(company);
//		}
//		
//		return post;
//	}
	
	@Override
	public Post getPostDetailInfoFromPostRequest(Post post, PostRequest postRequest, User user) {
		
		
		switch (post.getPostType()) {
		case DEAL:
		{
//			assert that only business account can post a new deal
			Assert.isTrue(user.getRole() == UserRole.BUSINESS, "Only Company can post a new deal!");;

//			get and assign deal information
			post = getDealPostDetailInfoFromPostRequest((DealPost) post, postRequest);
		}
			break;
		
		default:
			break;
		}
		
		return post;
	}
	
	@Override
	public Post getDealPostDetailInfoFromPostRequest(DealPost post, PostRequest postRequest) {
		
		String category = Optional.ofNullable(postRequest.getCategory()).orElse("");
		
//		assert that the category is not empty
		Assert.isTrue(!category.isEmpty(), "Category can't be empty");
		post.setCategory(category);
		
//		discount type
		String dealDiscountType = Optional.ofNullable(postRequest.getDealDiscountType()).orElse("");
		
//		assert that the discount type is not null
		Assert.isTrue(!dealDiscountType.isEmpty(), "Invalid Discount Type");
		
//		convert to enum
		DealDiscountType eDealDiscountType = DealDiscountType.valueOf(dealDiscountType);
		
//		assign discount type
		post.setDiscountType(eDealDiscountType);
		
//		assign discount value
		post.setDiscountValue(postRequest.getDiscountValue());
		
		return post;
	}
	
	@Override
	public PostResponse getPostResponse(Post post) {

		PostResponse postReq = new PostResponse();

//		set post basic information
		postReq.setId(post.getId());
		postReq.setDescription(post.getDescription());
		postReq.setCreatedOn(post.getCreatedOn());
		postReq.setUpdatedOn(post.getUpdatedOn());
		postReq.setStatus(post.getStatus());
		postReq.setPostType(post.getPostType());
		postReq.setLocation(post.getLocation());

//		set author information
		postReq.setAuthor(getPostAuthorInfo(post));

//		Get Post Detail Info
		postReq.setPostInfo(getPostDetailInfo(post));

		return postReq;
	}

	@Override
	public String getPostAuthorName(Post post) {

//		author name
		String authorName = "";

//		business user
		if (post.isCompanyPost()) {
			authorName = post.getCompany().getName();
		}
//		classic user
		else {
			User user = post.getAuthor();
//			authorName = user.getDisplayName();
		}

		return authorName;
	}

	@Override
	public Map<String, Object> getPostAuthorInfo(Post post) {

		Map<String, Object> author = new HashMap<>();
		author.put("id", post.getAuthor().getId());
		author.put("name", getPostAuthorName(post));
		author.put("emailVerified", post.getAuthor().isEmailVerified());
		author.put("phoneVerified", post.getAuthor().isPhoneVerified());

//		companyInfo for business post
		if (post.isCompanyPost()) {

			Map<String, Object> companyInfo = new HashMap<>();

			CompanyStatus companyStatus = post.getCompany().getStatus();
			companyInfo.put("companyId", post.getCompany().getId());
			companyInfo.put("companyStatus", post.getCompany().getStatus());

			CompanyStatus[] invalidCompanies = { CompanyStatus.PENDING };

			if (Arrays.asList(invalidCompanies).contains(companyStatus)) {
				companyInfo.put("registeredBy", post.getCompany().getAdministratorRole());
			}

			author.put("companyInfo", companyInfo);
		}

		return author;
	}

	@Override
	public Map<String, Object> getPostDetailInfo(Post post) {

		Map<String, Object> postInfo = new HashMap<>();

		switch (post.getPostType()) {

		case DEAL:
			postInfo = getDealInfo((DealPost) post);
			break;

		default:
			break;
		}

		return postInfo;
	}

	@Override
	public Map<String, Object> getDealInfo(DealPost post) {

		Map<String, Object> dealInfo = new HashMap<>();

		dealInfo.put("dealDiscountType", post.getDiscountType());
		
		dealInfo.put("discountValue", post.getDiscountValue());
		
		return dealInfo;
	}

//	============================================================================

	@Override
	public Post initializePostByType(PostType type) {
		Post post = null;

		switch (type) {
		case DEAL:
			post = new DealPost();
			break;
		default:
			post = new Post();
			break;
		}

//		assert that user is not null
		Assert.isTrue(post != null, "Failed Initialized Post");

		return post;
	}

//	============================================================================

	@Override
	public Post createPost(PostRequest postRequest) {

//		get post info
		Post post = getPostInfoFromPostRequest(postRequest);

//		persist post into database
		post = savePost(post);

		return post;
	}

	@Override
	public Post savePost(Post post) {
		return postDao.savePost(post);
	}

	@Override
	public void softDeletePost(Post post) {
		
//		soft delete
		post.setStatus(PostStatus.DELETED);
		
//		merge into database
		savePost(post);
	}

	@Override
	public void removePost(Post post) {
		// TODO Auto-generated method stub
		
	}









}
