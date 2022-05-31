package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.company.Company;

public interface ElasticSearchDao {

	void reIndexPersistedData(String className);
	
	List<Company> searchCompany(String keywords, boolean fetchAll, int fetchLimit);
}
