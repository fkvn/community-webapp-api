package mono.thainow.dao.jpa;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mono.thainow.dao.PostDao;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.profile.Profile;
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
	public void deletePost(long id) {
		Post post = entityManager.find(Post.class, id);
		entityManager.remove(post);
	}

	@Override
	public DealPost getValidDealPost(Long postId) {

		return entityManager.createQuery("from DealPost where deal.status IN (:status) and id =:id", DealPost.class)
				.setParameter("status", Arrays.asList(PostStatus.AVAILABLE, PostStatus.PRIVATE))
				.setParameter("id", postId).getSingleResult();
	}

	@Override
	public List<Post> getPosts(Profile profile) {
		return entityManager.createQuery("from Post where owner =: owner", Post.class).setParameter("owner", profile)
				.getResultList();
	}

}
