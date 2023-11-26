package mono.thainow.repository;

import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    Optional<User> findById(Long id);

    Optional<User> findByIdAndStatus(Long id, UserStatus userStatus);

    Optional<User> findByEmailAndStatus(String email, UserStatus userStatus);

    Optional<User> findByEmailAndStatusNot(String email, UserStatus userStatus);

    Optional<User> findByPhoneAndPhoneRegionAndStatus(String phone, String phoneRegion, UserStatus userStatus);

    Optional<User> findByPhoneAndPhoneRegionAndStatusNot(String phone, String phoneRegion, UserStatus userStatus);

    Optional<User> findBySubAndStatus(String sub, UserStatus userStatus);
}
