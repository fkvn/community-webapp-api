package mono.thainow.service.impl;

import java.util.List;

import org.hibernate.search.engine.search.query.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.SearchDao;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.post.housing.HousingPost;
import mono.thainow.domain.post.job.JobPost;
import mono.thainow.domain.post.marketplace.MarketplacePost;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.rest.response.SearchResponse;
import mono.thainow.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao searchDao;

//	@Autowired
//	private ProfileService profileService;

	@Override
	public SearchResponse<?> searchCompany(String industry, String keywords, double centerLat, double centerLng,
			int limit, int page, String sort, String within, int radius, List<Double> topLeft,
			List<Double> bottomRight) {

		SearchResult<CompanyProfile> result = searchDao.searchCompanyProfile(keywords, limit, page, centerLat,
				centerLng, industry, sort, within, radius, topLeft, bottomRight);

		SearchResponse<CompanyProfile> searchRes = new SearchResponse<CompanyProfile>();
		searchRes.setTotalCount(result.total().hitCount());
		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
		searchRes.setFetchResult(result.hits());

//		List<Company> companies = result.hits();
//
//		companies.forEach(com -> {
//			if (com.getStatus() == CompanyStatus.REGISTERED) {
//				com.setProfileId(profileService.getValidCompanyProfile(com).getId());
//			}
//		});
//
//		searchRes.setFetchResult(companies);

		return searchRes;
	}

	@Override
	public SearchResponse<?> searchDealPost(String category, String keywords, double centerLat, double centerLng,
			int limit, int page, String sort, String within, int radius, List<Double> topLeft,
			List<Double> bottomRight) {

		SearchResult<DealPost> result = searchDao.searchDealPost(keywords, limit, page, centerLat, centerLng, category,
				sort, within, radius, topLeft, bottomRight);

		SearchResponse<DealPost> searchRes = new SearchResponse<DealPost>();
		searchRes.setTotalCount(result.total().hitCount());
		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
		searchRes.setFetchResult(result.hits());

//		SearchResult<Deal> result = searchDao.searchDeal(keywords, limit, page, centerLat, centerLng, category, sort,
//				within, radius, topLeft, bottomRight);
//
//		SearchResponse<Post> searchRes = new SearchResponse<Post>();
//		System.out.println(result.total().isHitCountExact());
//		searchRes.setTotalCount(result.total().hitCount());
//		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
//
//		List<Deal> deals = result.hits();
//
//		List<Post> posts = deals.stream().map(deal -> postService.getPost(PostType.DEAL_POST, deal))
//				.collect(Collectors.toList());
//
//		searchRes.setFetchResult(posts);

		return searchRes;
	}

	@Override
	public SearchResponse<?> searchJobPost(String keywords, String position, String experience, String skills,
			Boolean remote, double centerLat, double centerLng, int limit, int page, String sort, String within,
			int radius, List<Double> topLeft, List<Double> bottomRight) {

		SearchResult<JobPost> result = searchDao.searchJobPost(keywords, position, experience, skills, remote, limit,
				page, centerLat, centerLng, sort, within, radius, topLeft, bottomRight);

		SearchResponse<JobPost> searchRes = new SearchResponse<JobPost>();
		searchRes.setTotalCount(result.total().hitCount());
		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
		searchRes.setFetchResult(result.hits());

//		SearchResult<Job> result = searchDao.searchJob(keywords, position, experience, skills, remote, limit, page,
//				centerLat, centerLng, sort, within, radius, topLeft, bottomRight);
//
//		SearchResponse<Post> searchRes = new SearchResponse<Post>();
//		searchRes.setTotalCount(result.total().hitCountLowerBound());
//		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
//
//		List<Job> jobs = result.hits();
//
//		List<Post> posts = jobs.stream().map(job -> postService.getPost(PostType.JOB_POST, job))
//				.collect(Collectors.toList());
//
//		searchRes.setFetchResult(posts);

		return searchRes;
	}

	@Override
	public SearchResponse<?> searchHousingPost(String keywords, String type, String costType, Double minCost,
			Double maxCost, Integer guest, Integer bed, Integer parking, Integer bath, String amenity, String category,
			double centerLat, double centerLng, int limit, int page, String sort, String within, int radius,
			List<Double> topLeft, List<Double> bottomRight) {

		SearchResult<HousingPost> result = searchDao.searchHousingPost(keywords, type, costType, minCost, maxCost,
				guest, bed, parking, bath, amenity, category, centerLat, centerLng, limit, page, sort, within, radius,
				topLeft, bottomRight);

		SearchResponse<HousingPost> searchRes = new SearchResponse<HousingPost>();
		searchRes.setTotalCount(result.total().hitCount());
		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
		searchRes.setFetchResult(result.hits());

//		SearchResult<Housing> result = searchDao.searchHousing(keywords, type, costType, minCost, maxCost, guest, bed,
//				parking, bath, amenity, category, centerLat, centerLng, limit, page, sort, within, radius, topLeft,
//				bottomRight);
//
//		SearchResponse<Post> searchRes = new SearchResponse<Post>();
//		System.out.println(result.total().isHitCountExact());
//		searchRes.setTotalCount(result.total().hitCount());
//		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
//
//		List<Housing> housings = result.hits();
//
//		List<Post> posts = housings.stream().map(housing -> postService.getPost(PostType.HOUSING_POST, housing))
//				.collect(Collectors.toList());
//
//		searchRes.setFetchResult(posts);
//
		return searchRes;
	}

	@Override
	public SearchResponse<?> searchMarketplacePost(String keywords, String condition, String category, Double minCost,
			Double maxCost, double centerLat, double centerLng, int limit, int page, String sort, String within,
			int radius, List<Double> topLeft, List<Double> bottomRight) {

		SearchResult<MarketplacePost> result = searchDao.searchMarketplacePost(keywords, condition, category, minCost,
				maxCost, centerLat, centerLng, limit, page, sort, within, radius, topLeft, bottomRight);

		SearchResponse<MarketplacePost> searchRes = new SearchResponse<MarketplacePost>();
		searchRes.setTotalCount(result.total().hitCount());
		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
		searchRes.setFetchResult(result.hits());

//		SearchResult<Marketplace> result = searchDao.searchMarketplace(keywords, condition, category, minCost, maxCost,
//				centerLat, centerLng, limit, page, sort, within, radius, topLeft, bottomRight);
//
//		SearchResponse<Post> searchRes = new SearchResponse<Post>();
//		searchRes.setTotalCount(result.total().hitCountLowerBound());
//		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
//
//		List<Marketplace> marketplaces = result.hits();
//
//		List<Post> posts = marketplaces.stream()
//				.map(marketplace -> postService.getPost(PostType.MARKETPLACE_POST, marketplace))
//				.collect(Collectors.toList());
//
//		searchRes.setFetchResult(posts);
//
		return searchRes;
	}

}
