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

//	@Override
//	public Company getCompanyById(Long id) {
//		return entityManager.find(Company.class, id);
//	}

	@Override
	@Transactional
	public Company saveCompany(Company company) {
		return entityManager.merge(company);
	}

//	@Override
//	@Transactional
//	public void removeCompany(Long id) {
//		Company company = entityManager.find(Company.class, id);
//		entityManager.remove(company);
//	}
//
//	@Override
//	public Company getCompany(String name, Location location) {
//		try {
//			return entityManager
//					.createQuery("from Company where UPPER(name) =:name and location =:location", Company.class)
//					.setParameter("name", name.toUpperCase()).setParameter("location", location).getSingleResult();
//		} catch (Exception ex) {
////			if location is new 
//			return null;
//		}
//	}

//	=====================================================

//	@Override
//	public boolean isEmailUnique(String email) {
//		try {
//
//			/*
//			 * if no error, means active user with the given email existed -> return false
//			 * 
//			 * We don't check email unique for users who are NOT ACTIVE
//			 */
//			entityManager.createQuery(
//					"from Company where (status =:status1 or status =:status2) and email =:email and email <> ''",
//					Company.class).setParameter("status1", CompanyStatus.UNREGISTERED)
//					.setParameter("status2", CompanyStatus.REGISTERED).setParameter("email", email).getSingleResult();
//
//			return false;
//
//		} catch (Exception ex) {
////			email is available
//			return true;
//		}
//	}
//
//	@Override
//	public boolean isPhoneUnique(String phone) {
//		try {
//
//			/*
//			 * if no error, means active user with the given phone existed -> return false
//			 * 
//			 * We don't check phone unique for users who are NOT ACTIVE
//			 */
//			entityManager.createQuery(
//					"from Company where (status =:status1 or status =:status2) and phone =:phone and phone <> ''",
//					Company.class).setParameter("status1", CompanyStatus.UNREGISTERED)
//					.setParameter("status2", CompanyStatus.REGISTERED).setParameter("phone", phone).getSingleResult();
//
//			return false;
//
//		} catch (Exception ex) {
////			phone is available
//			return true;
//		}
//	}

}
