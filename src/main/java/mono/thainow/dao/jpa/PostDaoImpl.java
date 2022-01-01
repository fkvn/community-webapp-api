package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.PostDao;
import mono.thainow.domain.post.Post;

@Repository
public class PostDaoImpl implements PostDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Post getPost(long id) {
		return entityManager.find(Post.class, id);
	}

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
