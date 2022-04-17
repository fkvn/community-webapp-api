package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.CompanyDao;
import mono.thainow.domain.company.Company;

@Repository
public class CompanyDaoImpl implements CompanyDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Company findCompanyById(Long id) {
		return entityManager.find(Company.class, id);
	}

	@Override
	public Company findCompanyByName(String name) {
		try {
			return entityManager.createQuery("from Company where name =:name", Company.class).setParameter("name", name)
					.getSingleResult();
		} catch (Exception ex) {
//			if location is new 
			return null;
		}
	}

	@Override
	@Transactional
	public Company saveCompany(Company company) {
		return entityManager.merge(company);
	}

	@Override
	@Transactional
	public void removeCompany(Long id) {
		Company company = entityManager.find(Company.class, id);
		entityManager.remove(company);
	}

}
