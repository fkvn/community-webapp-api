package mono.thainow.dao;

import java.util.List;

import org.hibernate.search.engine.search.query.SearchResult;

import mono.thainow.domain.company.Company;

public interface SearchDao {

	void reIndexPersistedData(String className);
	
	List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit);

	SearchResult<Company> searchCompany(String keywords, int limit, int page, double centerLat, double centerLng, String industry, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight);
}
