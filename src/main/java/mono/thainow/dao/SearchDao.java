package mono.thainow.dao;

import java.util.List;

import org.hibernate.search.engine.search.query.SearchResult;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.post.deal.Deal;
import mono.thainow.domain.post.housing.Housing;
import mono.thainow.domain.post.job.Job;
import mono.thainow.domain.post.marketplace.Marketplace;

public interface SearchDao {

	void reIndexPersistedData(String className);
	
	List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit);

	SearchResult<Company> searchCompany(String keywords, int limit, int page, double centerLat, double centerLng, String industry, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight);

	SearchResult<Deal> searchDeal(String keywords, int limit, int page, double centerLat, double centerLng,
			String category, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight);

	SearchResult<Job> searchJob(String keywords, String position, String experience, String skills, Boolean remote,
			int limit, int page, double centerLat, double centerLng, String sort, String within, int radius,
			List<Double> topLeft, List<Double> bottomRight);

	SearchResult<Housing> searchHousing(String keywords, String type, String costType, Double minCost, Double maxCost,
			Integer guest, Integer bed, Integer parking, Integer bath, String amenity, String category,
			double centerLat, double centerLng, int limit, int page, String sort, String within, int radius,
			List<Double> topLeft, List<Double> bottomRight);

	SearchResult<Marketplace> searchMarketplace(String keywords, String condition, String category, Double minCost,
			Double maxCost, double centerLat, double centerLng, int limit, int page, String sort, String within,
			int radius, List<Double> topLeft, List<Double> bottomRight);
}
