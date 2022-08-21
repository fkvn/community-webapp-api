package mono.thainow.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;

@Repository
public class ProfileDaoImpl implements ProfileDao {

	@PersistenceContext
	private EntityManager entityManager;

//	=============================================

	@Override
	public List<Profile> getProfiles(User account) {

		List<Profile> profiles = new ArrayList<>();

		profiles.add(getValidUserProfile(account));
		profiles.addAll(getValidCompanyProfiles(account));

		return profiles;

	}

	@Override
	public List<CompanyProfile> getValidCompanyProfiles(User account) {

		return entityManager
				.createQuery("from CompanyProfile where account =: user and company.status != :status",
						CompanyProfile.class)
				.setParameter("user", account).setParameter("status", CompanyStatus.REJECTED).getResultList();

	}

	@Override
	public List<Profile> getAllProfiles(User account) {
		return entityManager.createQuery("from Profile where account =: user", Profile.class)
				.setParameter("user", account).getResultList();
	}

	@Override
	public UserProfile getValidUserProfile(Long profileId) {

		return entityManager
				.createQuery("from UserProfile where id = :id and account.status = :status", UserProfile.class)
				.setParameter("id", profileId).setParameter("status", UserStatus.ACTIVATED).getSingleResult();
	}

	@Override
	public UserProfile getValidUserProfile(User user) {
		return entityManager
				.createQuery("from UserProfile where account =: user and account.status = :status", UserProfile.class)
				.setParameter("user", user).setParameter("status", UserStatus.ACTIVATED).getSingleResult();
	}

	@Override
	public CompanyProfile getValidCompanyProfile(Long profileId) {

		return entityManager
				.createQuery("from CompanyProfile where id = :id and profile_type =: type and company.status = :status",
						CompanyProfile.class)
				.setParameter("id", profileId).setParameter("type", "COMPANY_PROFILE")
				.setParameter("status", CompanyStatus.REGISTERED).getSingleResult();
	}

	@Override
	@Transactional
	public Profile saveProfile(Profile profile) {
		return entityManager.merge(profile);
	}

}
