package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.CompanyDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;

@Repository
public class CompanyDaoImpl implements CompanyDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Company getCompanyById(Long id) {
		return entityManager.find(Company.class, id);
	}

	@Override
	public Company getCompanyByName(String name) {
		try {
			return entityManager.createQuery("from Company where UPPER(name) =:name", Company.class)
					.setParameter("name", name.toUpperCase()).getSingleResult();
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

	@Override
	public Company getCompany(String name, Location location) {
		try {
			return entityManager.createQuery("from Company where UPPER(name) =:name and location =:location", Company.class)
					.setParameter("name", name.toUpperCase())
					.setParameter("location", location)
					.getSingleResult();
		} catch (Exception ex) {
//			if location is new 
			return null;
		}
	}

}
