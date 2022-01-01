package mono.thainow.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mono.thainow.domain.user.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
}
