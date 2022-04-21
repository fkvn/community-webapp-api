package mono.thainow.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.PostDao;
import mono.thainow.dao.UserDao;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.user.User;
import mono.thainow.rest.request.PostRequest;
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
	
	@Override
	public List<Post> getAllPosts() {
		return postDao.getAllPosts();
	}
	
	@Override
	public Long createPost(PostRequest postRequest) {
		
		Long authorId = Optional.ofNullable(postRequest.getAuthorId()).orElse(null);
		
//		assert that each post author is available
		Assert.isTrue(authorId != null, "Invalid Post Author!");
		
//		get post author info
		User user = userDao.getUser(authorId); 
		
//		create new post
		Post post = new Post();
		
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
		post.setStatus(PostStatus.valueOf(status));
		
//		post location
		Location location = locationService.getLocationFromPostRequest(postRequest);
		post.setLocation(location);
		
		
		
		return null;
	}



}
