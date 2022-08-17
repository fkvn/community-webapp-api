package mono.thainow.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.ProfileDao;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.ProfileStatus;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;

@Repository
public class ProfileDaoImpl implements ProfileDao {

	@PersistenceContext
	private EntityManager entityManager;

//	=============================================
	
	@Override
	public List<Profile> getProfiles(User account) {
		
		List<ProfileStatus> validStatus = new ArrayList<>();
		validStatus.add(ProfileStatus.ACTIVATED);
		validStatus.add(ProfileStatus.PENDING);
		
		return entityManager.createQuery("from Profile where account =: user and status IN (:status)", Profile.class)
				.setParameter("user", account)
				.setParameter("status", validStatus)
				.getResultList();
	}
	
	@Override
	public UserProfile getUserProfile(User user) {
		
		return entityManager.createQuery("from UserProfile where account =: user and profile_type =: type and status = :status", UserProfile.class)
				.setParameter("user", user)
				.setParameter("type", "USER_PROFILE")
				.setParameter("status", ProfileStatus.ACTIVATED)
				.getSingleResult();
	}

	@Override
	@Transactional
	public Profile saveProfile(Profile profile) {
		return entityManager.merge(profile);
	}

}
