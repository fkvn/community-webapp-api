package mono.thainow.repository;

import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.user.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProfileRepository extends JpaRepository<Profile, Long> {

    Optional<Profile> findProfileByAccount(User user);

    Optional<Profile> findProfileByAccount_Id(Long id);
}
