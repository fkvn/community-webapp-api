package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.EmailDao;
import mono.thainow.domain.email.EmailDetails;

@Repository
public class EmailDaoImpl implements EmailDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	@Transactional
	public EmailDetails saveEmail(EmailDetails email) {
		return entityManager.merge(email);
	}

}
