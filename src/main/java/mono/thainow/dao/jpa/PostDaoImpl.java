package mono.thainow.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mono.thainow.dao.PostDao;
import mono.thainow.domain.post.Post;
import mono.thainow.repository.PostRepository;

@Repository
public class PostDaoImpl implements PostDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private PostRepository postRepository;
	
//	===========================================
	
	@Override
	public List<Post> getAllPosts() {
		return postRepository.findAll();
	}
	
	
	@Override
	public Post getPost(long id) {
		return entityManager.find(Post.class, id);
	}

//	===========================================
	
	@Override
	@Transactional
	public Post savePost(Post post) {
		return entityManager.merge(post);
	}

	@Override
	@Transactional
	public void removePost(long id) {
		Post post = entityManager.find(Post.class, id);
		entityManager.remove(post);
	}



}
