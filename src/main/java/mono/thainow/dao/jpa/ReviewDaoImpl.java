package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.ReviewDao;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.review.ReviewStatus;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Review saveReview(Review newReview) {
		return entityManager.merge(newReview);
	}

	@Override
	public Review getValidReview(Long reviewId) {
		return entityManager.createQuery("from Review where id =:id and status =:status", Review.class)
		.setParameter("status", ReviewStatus.ACTIVATED)
		.setParameter("id", reviewId).getSingleResult();
	}

}
