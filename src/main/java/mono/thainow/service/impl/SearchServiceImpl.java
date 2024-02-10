package mono.thainow.service.impl;

import mono.thainow.dao.SearchDao;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.guideBook.GuideBook;
import mono.thainow.domain.post.guideBook.GuideBookCategory;
import mono.thainow.domain.post.guideBook.GuideBookPost;
import mono.thainow.rest.response.SearchResponse;
import mono.thainow.service.SearchService;
import org.hibernate.search.engine.search.query.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


//
//import java.util.List;
//import java.util.Map;
//
//import org.hibernate.search.engine.search.aggregation.AggregationKey;
//import org.hibernate.search.engine.search.query.SearchResult;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import mono.thainow.dao.SearchDao;
//import mono.thainow.domain.post.deal.DealPost;
//import mono.thainow.domain.post.housing.HousingPost;
//import mono.thainow.domain.post.job.JobPost;
//import mono.thainow.domain.post.marketplace.MarketplacePost;
//import mono.thainow.domain.profile.BusinessProfile;
//import mono.thainow.domain.review.PostReview;
//import mono.thainow.domain.review.ProfileReview;
//import mono.thainow.rest.response.SearchResponse;
//import mono.thainow.rest.response.SearchReviewResponse;
//import mono.thainow.service.SearchService;
//
@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchDao searchDao;

    @Override
    public SearchResponse<?> searchGuideBookPost(Long profileId, Long requesterId, String keywords,
                                                 String title, GuideBookCategory category,
                                                 int limit, int page, String sortBy,
                                                 String sortByOrder, List<PostStatus> status) {

        SearchResult<GuideBookPost> result =
                searchDao.searchGuideBookPost(profileId, requesterId, keywords, title, category,
                        limit, page, sortBy, sortByOrder, status);

        SearchResponse<GuideBookPost> searchRes = new SearchResponse<>();
        searchRes.setTotalCount(result.total().hitCount());
        searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
        searchRes.setFetchResult(result.hits());

        return searchRes;

    }

    @Override
    public SearchResponse<?> searchGuideBook(Long profileId, Long requesterId, String keywords,
                                             GuideBookCategory category, int limit, int page,
                                             String sortBy, String sortByOrder, PostStatus status) {

        SearchResult<GuideBook> result =
                searchDao.searchGuideBook(profileId, requesterId, keywords, category, limit, page,
                        sortBy, sortByOrder, status);

        SearchResponse<GuideBook> searchRes = new SearchResponse<>();
        searchRes.setTotalCount(result.total().hitCount());
        searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
        searchRes.setFetchResult(result.hits());

        return searchRes;
    }
    //

    //
    ////	@Autowired
    ////	private ProfileService profileService;
    //
    //	@Override
    //	public SearchResponse<?> searchCompany(String industry, String keywords, double centerLat,
    //	double centerLng,
    //			int limit, int page, String sort, String sortOrder, String within, int radius,
    //			List<Double> topLeft, List<Double> bottomRight) {
    //
    //		SearchResult<BusinessProfile> result = searchDao.searchCompanyProfile(keywords, limit,
    //		page, centerLat,
    //				centerLng, industry, sort, sortOrder, within, radius, topLeft, bottomRight);
    //
    //		SearchResponse<BusinessProfile> searchRes = new SearchResponse<BusinessProfile>();
    //		searchRes.setTotalCount(result.total().hitCount());
    //		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
    //		searchRes.setFetchResult(result.hits());
    //
    //		return searchRes;
    //	}
    //
    //	@Override
    //	public SearchResponse<?> searchDealPost(Long requesterId, Long ownerId, String category,
    //	String keywords,
    //			double centerLat, double centerLng, int limit, int page, String sort, String
    //			sortOrder,
    //			String within, int radius, List<Double> topLeft, List<Double> bottomRight, String
    //			status) {
    //
    //		SearchResult<DealPost> result = searchDao.searchDealPost(requesterId, ownerId,
    //		keywords,
    //		limit, page, centerLat,
    //				centerLng, category, sort, sortOrder, within, radius, topLeft, bottomRight,
    //				status);
    //
    //		SearchResponse<DealPost> searchRes = new SearchResponse<DealPost>();
    //		searchRes.setTotalCount(result.total().hitCount());
    //		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
    //		searchRes.setFetchResult(result.hits());
    //
    //		return searchRes;
    //	}
    //
    //	@Override
    //	public SearchResponse<?> searchJobPost(Long requesterId, Long ownerId, String keywords,
    //	String
    //	positions,
    //			String experience, String skills, Boolean remote, double centerLat, double
    //			centerLng,
    //			int limit, int page,
    //			String sort, String sortOrder, String within, int radius, List<Double> topLeft,
    //			List<Double> bottomRight, String status) {
    //
    //		SearchResult<JobPost> result = searchDao.searchJobPost(requesterId, ownerId, keywords,
    //		positions, experience, skills,
    //				remote, limit, page, centerLat, centerLng, sort, sortOrder, within, radius,
    //				topLeft, bottomRight, status);
    //
    //		SearchResponse<JobPost> searchRes = new SearchResponse<JobPost>();
    //		searchRes.setTotalCount(result.total().hitCount());
    //		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
    //		searchRes.setFetchResult(result.hits());
    //
    //		return searchRes;
    //	}
    //
    //	@Override
    //	public SearchResponse<?> searchHousingPost(Long requesterId, Long ownerId, String keywords,
    //	String type,
    //			String costType, Double minCost, Double maxCost, Integer guest, Integer bed,
    //			Integer
    //			parking, Integer bath,
    //			String amenity, String category, double centerLat, double centerLng, int limit, int
    //			page, String sort,
    //			String sortOrder, String within, int radius, List<Double> topLeft, List<Double>
    //			bottomRight, String status) {
    //
    //		SearchResult<HousingPost> result = searchDao.searchHousingPost(requesterId, ownerId,
    //		keywords, type, costType,
    //				minCost, maxCost, guest, bed, parking, bath, amenity, category, centerLat,
    //				centerLng, limit, page, sort,
    //				sortOrder, within, radius, topLeft, bottomRight, status);
    //
    //		SearchResponse<HousingPost> searchRes = new SearchResponse<HousingPost>();
    //		searchRes.setTotalCount(result.total().hitCount());
    //		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
    //		searchRes.setFetchResult(result.hits());
    //
    //		return searchRes;
    //	}
    //
    //	@Override
    //	public SearchResponse<?> searchMarketplacePost(Long requesterId, Long ownerId, String
    //	keywords, String condition,
    //			String category, Double minCost, Double maxCost, double centerLat, double
    //			centerLng,
    //			int limit, int page,
    //			String sort, String sortOrder, String within, int radius, List<Double> topLeft,
    //			List<Double> bottomRight, String status) {
    //
    //		SearchResult<MarketplacePost> result = searchDao.searchMarketplacePost(requesterId,
    //		ownerId, keywords, condition,
    //				category, minCost, maxCost, centerLat, centerLng, limit, page, sort, sortOrder,
    //				within, radius, topLeft, bottomRight, status);
    //
    //		SearchResponse<MarketplacePost> searchRes = new SearchResponse<MarketplacePost>();
    //		searchRes.setTotalCount(result.total().hitCount());
    //		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
    //		searchRes.setFetchResult(result.hits());
    //
    //		return searchRes;
    //	}
    //
    //	@Override
    //	public SearchReviewResponse<?> searchPostReview(Long id, String sort, String sortOrder, int
    //	limit, int page, Long reviewerId) {
    //
    //		AggregationKey<Map<Integer, Long>> countsByRateKey = AggregationKey.of("countsByRate");
    //
    //		SearchResult<PostReview> result = searchDao.searchPostReview(id, sort, sortOrder,
    //		limit,
    //		page, countsByRateKey, reviewerId);
    //
    //		SearchReviewResponse<PostReview> searchRes = new SearchReviewResponse<PostReview>();
    //		searchRes.setTotalCount(result.total().hitCount());
    //		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
    //		searchRes.setFetchResult(result.hits());
    //		searchRes.setCategory(result.aggregation(countsByRateKey));
    //
    //		return searchRes;
    //	}
    //
    //	@Override
    //	public SearchReviewResponse<?> serachProfileReview(Long id, String sort, String sortOrder,
    //	int
    //	limit, int page) {
    //
    //		AggregationKey<Map<Integer, Long>> countsByRateKey = AggregationKey.of("countsByRate");
    //
    //		SearchResult<ProfileReview> result = searchDao.searchProfileReview(id, sort, sortOrder,
    //		limit, page, countsByRateKey);
    //
    //		SearchReviewResponse<ProfileReview> searchRes = new
    //		SearchReviewResponse<ProfileReview>();
    //		searchRes.setTotalCount(result.total().hitCount());
    //		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);
    //		searchRes.setFetchResult(result.hits());
    //		searchRes.setCategory(result.aggregation(countsByRateKey));
    //
    //		return searchRes;
    //	}
    //
}
