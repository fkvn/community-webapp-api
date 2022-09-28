package mono.thainow.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.profile.BusinessProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;

@Repository
public class ProfileDaoImpl implements ProfileDao {

	@PersistenceContext
	private EntityManager entityManager;

//	=============================================

//	@Override
//	public List<Profile> findProfilesByAccount(User account) {
//
//		List<Profile> profiles = new ArrayList<>();
//
//		profiles.add(findActiveUserProfileByAccount(account));
//		profiles.addAll(findBusinessProfilesByAccount(account));
//
//		return profiles;
//
//	}

	@Override
	public List<BusinessProfile> findBusinessProfilesByAccount(User account) {

		return entityManager
				.createQuery("from BusinessProfile where account =: user and company.status != :status",
						BusinessProfile.class)
				.setParameter("user", account).setParameter("status", CompanyStatus.REJECTED).getResultList();

	}

//	@Override
//	public List<Profile> findAllProfilesByAccount(User account) {
//		return entityManager.createQuery("from Profile where account =: user", Profile.class)
//				.setParameter("user", account).getResultList();
//	}

	@Override
	public UserProfile findActiveUserProfileByAccountId(Long profileId) {

		return entityManager
				.createQuery("from UserProfile where account.id = :id and account.status = :status", UserProfile.class)
				.setParameter("id", profileId)
				.setParameter("status", UserStatus.ACTIVATED)
				.getSingleResult();
	}

	@Override
	public UserProfile findActiveUserProfileByAccount(User user) {
		return entityManager
				.createQuery("from UserProfile where account =: user and account.status = :status", UserProfile.class)
				.setParameter("user", user)
				.setParameter("status", UserStatus.ACTIVATED)
				.getSingleResult();
	}

//	@Override
//	public BusinessProfile findRegisteredBusinessProfileById(Long profileId) {
//
//		return entityManager
//				.createQuery("from BusinessProfile where id = :id and company.status = :status", BusinessProfile.class)
//				.setParameter("id", profileId).setParameter("status", CompanyStatus.REGISTERED).getSingleResult();
//	}

	@Override
	public Profile findProfileById(Long profileId) {
		Profile profile = entityManager.find(Profile.class, profileId);

		if (profile == null)
			throw new NoResultException();

		return profile;
	}

	@Override
	@Transactional
	public Profile saveProfile(Profile profile) {
		return entityManager.merge(profile);
	}

	@Override
	@Transactional
	public void deleteProfileById(Long profileId) {
		Profile profile = entityManager.find(Profile.class, profileId);
		entityManager.remove(profile);
	}

//	@Override
//	public BusinessProfile getValidCompanyProfile(Company com) {
//		return entityManager
//				.createQuery("from CompanyProfile where company =: com and company.status = :status",
//						BusinessProfile.class)
//				.setParameter("com", com).setParameter("status", CompanyStatus.REGISTERED).getSingleResult();
//	}
//
//	@Override
//	public BusinessProfile findBusinessProfileById(Long profileId) {
//		BusinessProfile profile = entityManager.find(BusinessProfile.class, profileId);
//
//		if (profile == null)
//			throw new NoResultException();
//
//		return profile;
//	}

	@Override
	public List<Profile> findProfilesByAccountId(Long id) {
		List<Profile> profiles = new ArrayList<>();

		profiles.add(findActiveUserProfileByAccountId(id));
		profiles.addAll(findBusinessProfilesByAccountId(id));

		return profiles;
	}

	@Override
	public List<BusinessProfile> findBusinessProfilesByAccountId(Long id) {
		return entityManager
				.createQuery("from BusinessProfile where account.id =: id and company.status != :status",
						BusinessProfile.class)
				.setParameter("id", id).setParameter("status", CompanyStatus.REJECTED).getResultList();
	}

//	@Override
//	public UserProfile findUserProfileById(Long profileId) {
//		UserProfile profile = entityManager.find(UserProfile.class, profileId);
//
//		if (profile == null)
//			throw new NoResultException();
//
//		return profile;
//	}

}
