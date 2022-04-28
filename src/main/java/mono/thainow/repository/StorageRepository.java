package mono.thainow.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mono.thainow.domain.storage.Storage;

public interface StorageRepository extends JpaRepository<Storage, Long> {
	
}
