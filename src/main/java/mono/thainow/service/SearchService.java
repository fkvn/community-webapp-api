package mono.thainow.service;

import java.util.List;

import mono.thainow.rest.response.SearchResponse;

public interface SearchService {

	SearchResponse<?> searchCompany(String industry, String keywords, double centerLat, double centerLng, int limit,
			int page, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight);

	SearchResponse<?> searchDeal(String category, String keywords, double centerLat, double centerLng, int limit,
			int page, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight);

	SearchResponse<?> searchJob(String keywords, String position, String experience, String skills, Boolean remote,
			double centerLat, double centerLng, int limit, int page, String sort, String within, int radius,
			List<Double> topLeft, List<Double> bottomRight);
}
