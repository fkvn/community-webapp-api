package mono.thainow.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import mono.thainow.domain.company.Company;

public interface CompanyRepository extends JpaRepository<Company, Long> {
	
}

