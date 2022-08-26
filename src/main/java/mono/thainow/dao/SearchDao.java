package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;

public interface SearchDao {

	void reIndexPersistedData(String className);
	
	List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit);

	List<Company> searchCompany(String keywords, int limit, int page, Location location);
}
