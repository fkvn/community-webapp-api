package mono.thainow.repository;

import mono.thainow.domain.storage.Storage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface StorageRepository extends JpaRepository<Storage, Long> {

    Optional<Storage> findById(Long id);

}
