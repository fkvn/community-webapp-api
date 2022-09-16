package mono.thainow.service;

import java.util.List;

import mono.thainow.rest.response.SearchResponse;
import mono.thainow.rest.response.SearchReviewResponse;

public interface SearchService {

	SearchResponse<?> searchCompany(String industry, String keywords, double centerLat, double centerLng, int limit,
			int page, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight);

	SearchResponse<?> searchDealPost(String category, String keywords, double centerLat, double centerLng, int limit,
			int page, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight);

	SearchResponse<?> searchJobPost(String keywords, String position, String experience, String skills, Boolean remote,
			double centerLat, double centerLng, int limit, int page, String sort, String within, int radius,
			List<Double> topLeft, List<Double> bottomRight);

	SearchResponse<?> searchHousingPost(String keywords, String type, String costType, Double minCost, Double maxCost,
			Integer guest, Integer bed, Integer parking, Integer bath, String amenity, String category,
			double centerLat, double centerLng, int limit, int page, String sort, String within, int radius,
			List<Double> topLeft, List<Double> bottomRight);

	SearchResponse<?> searchMarketplacePost(String keywords, String condition, String category, Double minCost,
			Double maxCost, double centerLat, double centerLng, int limit, int page, String sort, String within,
			int radius, List<Double> topLeft, List<Double> bottomRight);

	SearchReviewResponse<?> searchPostReview(Long id, String sort, int limit, int page, Long profileId);

	SearchReviewResponse<?> serachProfileReview(Long id, String sort, int limit, int page);
}
