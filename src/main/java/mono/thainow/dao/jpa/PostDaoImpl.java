package mono.thainow.dao.jpa;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.PostDao;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.profile.Profile;

@Repository
public class PostDaoImpl implements PostDao {

	@PersistenceContext
	private EntityManager entityManager;

//	===========================================

	@Override
	public List<Post> getPosts(Profile profile) {
		return entityManager.createQuery("from Post where owner =: owner", Post.class).setParameter("owner", profile)
				.getResultList();
	}

	@Override
	public List<Post> getPosts(Profile postOwner, PostType postType) {

		String sql = "";

		switch (postType) {
		case DEAL_POST:
			sql = "from Post where owner =: owner and deal.status IN (:status)";
			break;
		case JOB_POST:
			sql = "from Post where owner =: owner and job.status IN (:status)";
			break;
		case HOUSING_POST:
			sql = "from Post where owner =: owner and housing.status IN (:status)";
			break;
		case MARKETPLACE_POST:
			sql = "from Post where owner =: owner and marketplace.status IN (:status)";
			break;
		default:
			break;
		}

		return entityManager.createQuery(sql, Post.class)
				.setParameter("status", Arrays.asList(PostStatus.AVAILABLE, PostStatus.PRIVATE))
				.setParameter("owner", postOwner).getResultList();
	}

	@Override
	public Post getPost(long id) {
		return entityManager.find(Post.class, id);
	}

	@Override
	public Post getValidPost(Long postId, PostType type) {

		String sql = "";

		switch (type) {
		case DEAL_POST:
			sql = "from Post where deal.status IN (:status) and id =:id";
			break;
		case JOB_POST:
			sql = "from Post where job.status IN (:status) and id =:id";
			break;
		case HOUSING_POST:
			sql = "from Post where housing.status IN (:status) and id =:id";
			break;
		case MARKETPLACE_POST:
			sql = "from Post where marketplace.status IN (:status) and id =:id";
			break;
		default:
			break;
		}

		return entityManager.createQuery(sql, Post.class)
				.setParameter("status", Arrays.asList(PostStatus.AVAILABLE, PostStatus.PRIVATE))
				.setParameter("id", postId).getSingleResult();
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

}