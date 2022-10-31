package mono.thainow.dao.jpa;

import java.util.Arrays;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
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
	public List<Post> findPostsByProfile(Profile profile) {
		return entityManager.createQuery("from Post where owner =: owner", Post.class).setParameter("owner", profile)
				.getResultList();
	}

//	@Override
//	public List<Post> getPosts(Profile postOwner, PostType postType, String sort, int page, int limit,
//			boolean ownerRequest) {
//
//		String sql = "";
//		String entity = "";
//
////		type
//		switch (postType) {
//		case DEAL_POST:
//			entity = "deal";
//			break;
//		case JOB_POST:
//			entity = "job";
//			break;
//		case HOUSING_POST:
//			entity = "housing";
//			break;
//		case MARKETPLACE_POST:
//			entity = "marketplace";
//			break;
//		default:
//			break;
//		}
//
//		sql = "from Post where owner =: owner and " + entity + ".status IN (:status)";
//
////		sort
//		switch (sort) {
//		default:
//			sql += " ORDER BY " + entity + ".updatedOn DESC";
//			break;
//		}
//
//		List<PostStatus> validPostStatus = ownerRequest ? Arrays.asList(PostStatus.AVAILABLE, PostStatus.PRIVATE)
//				: Arrays.asList(PostStatus.AVAILABLE);
//
//		return entityManager.createQuery(sql, Post.class).setParameter("status", validPostStatus)
//				.setParameter("owner", postOwner).setFirstResult((page - 1) * limit).setMaxResults(limit)
//				.getResultList();
//	}

	@Override
	public Post findPostById(long id) {
		Post post = entityManager.find(Post.class, id);

		if (post == null)
			throw new NoResultException();

		return post;
	}

	@Override
	public Post findValidPost(Long postId, PostType type) {

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
	public void deletePostById(long id) {
		Post post = entityManager.find(Post.class, id);
		entityManager.remove(post);
	}

	@Override
	@Transactional
	public void deletePost(Post post) {
		entityManager.remove(post);
	}

//	@Override
//	public Post getPost(PostType type, Object entity) {
//		String sql = "";
//
//		switch (type) {
//		case DEAL_POST:
//			sql = "from Post where deal =:entity";
//			break;
//		case JOB_POST:
//			sql = "from Post where job =:entity";
//			break;
//		case HOUSING_POST:
//			sql = "from Post where housing =:entity";
//			break;
//		case MARKETPLACE_POST:
//			sql = "from Post where marketplace =:entity";
//			break;
//		default:
//			break;
//		}
//
//		return entityManager.createQuery(sql, Post.class).setParameter("entity", entity).getSingleResult();
//	}

}