package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.JobDao;
import mono.thainow.domain.post.job.Job;

@Repository
public class JobDaoImpl implements JobDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public Job saveJob(Job job) {
		return entityManager.merge(job);
	}

}
