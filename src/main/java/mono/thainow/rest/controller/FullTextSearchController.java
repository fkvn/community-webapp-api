package mono.thainow.rest.controller;

//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseStatus;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.fasterxml.jackson.annotation.JsonView;
//
//import mono.thainow.domain.company.Company;
//import mono.thainow.domain.location.Location;
//import mono.thainow.domain.review.ReviewType;
//import mono.thainow.exception.BadRequest;
//import mono.thainow.rest.response.SearchResponse;
//import mono.thainow.rest.response.SearchReviewResponse;
//import mono.thainow.service.CompanyService;
//import mono.thainow.service.FullTextSearchService;
//import mono.thainow.service.LocationService;
//import mono.thainow.service.SearchService;
//import mono.thainow.view.View;
//

import com.fasterxml.jackson.annotation.JsonView;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.guideBook.GuideBookCategory;
import mono.thainow.rest.response.SearchResponse;
import mono.thainow.service.FullTextSearchService;
import mono.thainow.service.SearchService;
import mono.thainow.view.View;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/search")
public class FullTextSearchController {
    //
    @Autowired
    private FullTextSearchService fulltextSearchService;

    @Autowired
    private SearchService searchService;
    //
    //	@Autowired
    //	private CompanyService companyService;
    //

    //
    //	@Autowired
    //	private LocationService locationService;
    //

    @PostMapping("/reindex")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void indexEntity(@RequestParam(required = false) String className) {
        fulltextSearchService.reIndexPersistedData(className);
    }

    @PostMapping("/reindex/list")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void indexEntities(@RequestBody Map<String, List<String>> classList) {
        fulltextSearchService.reIndexPersistedData(classList.get("classNames"));
    }

    @GetMapping("/guidebooks")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @JsonView(View.Basic.class)
    public SearchResponse<?> fetchGuideBookPost(@RequestParam(defaultValue = "-1") Long profileId,
                                                @RequestParam(defaultValue = "-1") Long requesterId,
                                                @RequestParam(defaultValue = "") String keywords,
                                                @RequestParam(defaultValue = "") String title,
                                                @RequestParam(required = false)
                                                GuideBookCategory category,
                                                @RequestParam(required = false)
                                                List<PostStatus> status,
                                                @RequestParam(defaultValue = "") String sortBy,
                                                @RequestParam(defaultValue = "desc")
                                                String sortByOrder,
                                                @RequestParam(defaultValue = "1") int page,
                                                @RequestParam(defaultValue = "20") int limit) {

        SearchResponse<?> res =
                searchService.searchGuideBookPost(profileId, requesterId, keywords, title, category,
                        limit, page, sortBy, sortByOrder, status);

        return res;
    }


    //
    //	@GetMapping("/companies/name")
    //	@ResponseStatus(HttpStatus.ACCEPTED)
    //	@JsonView(View.Basic.class)
    //	public List<Company> SearchCompanyByName(@RequestParam String keywords, @RequestParam
    //	boolean
    //	fetchAll,
    //			@RequestParam int fetchLimit) {
    //		return companyService.searchCompanyByNameOnly(keywords, fetchAll, fetchLimit);
    //	}
    //
    //	@GetMapping("/business")
    //	@ResponseStatus(HttpStatus.ACCEPTED)
    //	@JsonView(View.Basic.class)
    //	public SearchResponse<?> SearchCompanies(@RequestParam(defaultValue = "") String keywords,
    //			@RequestParam(defaultValue = "All") String industry, @RequestParam(defaultValue =
    //			"")
    //			String placeid,
    //			@RequestParam(defaultValue = "Thai Town, Los Angeles, CA 90027, USA") String
    //			address,
    //			@RequestParam(defaultValue = "Date") String sort, @RequestParam(defaultValue =
    //			"desc")
    //			String sortOrder,
    //			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int
    //			limit,
    //			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue =
    //			"20") int radius,
    //			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
    //			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {
    //
    //		Location location = locationService.findLocationByPlaceidOrAddress(placeid, address);
    //
    //		SearchResponse<?> res = searchService.searchCompany(industry, keywords, location
    //		.getLat(),
    //		location.getLng(),
    //				limit, page, sort, sortOrder, within, radius, topLeft, bottomRight);
    //
    //		res.setLocation(location);
    //
    //		return res;
    //	}
    //
    //	@GetMapping("/deals")
    //	@ResponseStatus(HttpStatus.ACCEPTED)
    //	@JsonView(View.Basic.class)
    //	public SearchResponse<?> searchDealPost(@RequestParam(defaultValue = "-1") Long ownerId,
    //			@RequestParam(defaultValue = "-1") Long requesterId, @RequestParam(defaultValue =
    //			"")
    //			String keywords,
    //			@RequestParam(defaultValue = "All") String category, @RequestParam(defaultValue =
    //			"All") String status,
    //			@RequestParam(defaultValue = "ChIJf2z2Hle_woARaNaIiR198fg") String placeid,
    //			@RequestParam(defaultValue = "Thai Town, Los Angeles, CA 90027, USA") String
    //			address,
    //			@RequestParam(defaultValue = "Date") String sort, @RequestParam(defaultValue =
    //			"desc")
    //			String sortOrder,
    //			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int
    //			limit,
    //			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue =
    //			"20") int radius,
    //			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
    //			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {
    //
    //		Location location = locationService.findLocationByPlaceidOrAddress(placeid, address);
    //
    //		SearchResponse<?> res = searchService.searchDealPost(requesterId, ownerId, category,
    //		keywords,
    //				location.getLat(), location.getLng(), limit, page, sort, sortOrder, within,
    //				radius, topLeft,
    //				bottomRight, status);
    //
    //		res.setLocation(location);
    //
    //		return res;
    //	}
    //
    //	@GetMapping("/jobs")
    //	@ResponseStatus(HttpStatus.ACCEPTED)
    //	@JsonView(View.Basic.class)
    //	public SearchResponse<?> searchJobPost(@RequestParam(defaultValue = "-1") Long ownerId,
    //			@RequestParam(defaultValue = "-1") Long requesterId, @RequestParam(defaultValue =
    //			"")
    //			String keywords,
    //			@RequestParam(defaultValue = "All") String status, @RequestParam(defaultValue =
    //			"All")
    //			String positions,
    //			@RequestParam(defaultValue = "All") String experience, @RequestParam(defaultValue =
    //			"All") String skills,
    //			@RequestParam(defaultValue = "false") Boolean remote,
    //			@RequestParam(defaultValue = "ChIJf2z2Hle_woARaNaIiR198fg") String placeid,
    //			@RequestParam(defaultValue = "Thai Town, Los Angeles, CA 90027, USA") String
    //			address,
    //			@RequestParam(defaultValue = "Date") String sort, @RequestParam(defaultValue =
    //			"desc")
    //			String sortOrder,
    //			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int
    //			limit,
    //			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue =
    //			"20") int radius,
    //			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
    //			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {
    //
    //		Location location = locationService.findLocationByPlaceidOrAddress(placeid, address);
    //
    //		SearchResponse<?> res = searchService.searchJobPost(requesterId, ownerId, keywords,
    //		positions, experience,
    //				skills, remote, location.getLat(), location.getLng(), limit, page, sort,
    //				sortOrder, within, radius,
    //				topLeft, bottomRight, status);
    //
    //		res.setLocation(location);
    //
    //		return res;
    //	}
    //
    //	@GetMapping("/housings")
    //	@ResponseStatus(HttpStatus.ACCEPTED)
    //	@JsonView(View.Basic.class)
    //	public SearchResponse<?> searchHousingPost(@RequestParam(defaultValue = "-1") Long ownerId,
    //			@RequestParam(defaultValue = "-1") Long requesterId, @RequestParam(defaultValue =
    //			"")
    //			String keywords,
    //			@RequestParam(defaultValue = "All") String status, @RequestParam(defaultValue =
    //			"All")
    //			String type,
    //			@RequestParam(defaultValue = "All") String costType, @RequestParam(defaultValue =
    //			"0")
    //			Double minCost,
    //			@RequestParam(defaultValue = "0") Double maxCost, @RequestParam(defaultValue = "0")
    //			Integer guest,
    //			@RequestParam(defaultValue = "0") Integer bed, @RequestParam(defaultValue = "0")
    //			Integer parking,
    //			@RequestParam(defaultValue = "0") Integer bath, @RequestParam(defaultValue = "All")
    //			String amenities,
    //			@RequestParam(defaultValue = "All") String category,
    //			@RequestParam(defaultValue = "ChIJf2z2Hle_woARaNaIiR198fg") String placeid,
    //			@RequestParam(defaultValue = "Thai Town, Los Angeles, CA 90027, USA") String
    //			address,
    //			@RequestParam(defaultValue = "Date") String sort, @RequestParam(defaultValue =
    //			"desc")
    //			String sortOrder,
    //			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int
    //			limit,
    //			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue =
    //			"20") int radius,
    //			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
    //			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {
    //
    //		Location location = locationService.findLocationByPlaceidOrAddress(placeid, address);
    //
    //		SearchResponse<?> res = searchService.searchHousingPost(requesterId, ownerId, keywords,
    //		type, costType, minCost,
    //				maxCost, guest, bed, parking, bath, amenities, category, location.getLat(),
    //				location.getLng(), limit,
    //				page, sort, sortOrder, within, radius, topLeft, bottomRight, status);
    //
    //		res.setLocation(location);
    //
    //		return res;
    //	}
    //
    //	@GetMapping("/marketplaces")
    //	@ResponseStatus(HttpStatus.ACCEPTED)
    //	@JsonView(View.Basic.class)
    //	public SearchResponse<?> searchMarketplacePost(@RequestParam(defaultValue = "-1") Long
    //	ownerId,
    //			@RequestParam(defaultValue = "-1") Long requesterId, @RequestParam(defaultValue =
    //			"")
    //			String keywords,
    //			@RequestParam(defaultValue = "All") String status, @RequestParam(defaultValue =
    //			"All")
    //			String condition,
    //			@RequestParam(defaultValue = "All") String category, @RequestParam(defaultValue =
    //			"0")
    //			Double minCost,
    //			@RequestParam(defaultValue = "0") Double maxCost,
    //			@RequestParam(defaultValue = "ChIJf2z2Hle_woARaNaIiR198fg") String placeid,
    //			@RequestParam(defaultValue = "Thai Town, Los Angeles, CA 90027, USA") String
    //			address,
    //			@RequestParam(defaultValue = "Date") String sort, @RequestParam(defaultValue =
    //			"desc")
    //			String sortOrder,
    //			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int
    //			limit,
    //			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue =
    //			"20") int radius,
    //			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
    //			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {
    //
    //		Location location = locationService.findLocationByPlaceidOrAddress(placeid, address);
    //
    //		SearchResponse<?> res = searchService.searchMarketplacePost(requesterId, ownerId,
    //		keywords, condition, category,
    //				minCost, maxCost, location.getLat(), location.getLng(), limit, page, sort,
    //				sortOrder, within, radius,
    //				topLeft, bottomRight, status);
    //
    //		res.setLocation(location);
    //
    //		return res;
    //	}
    //
    //	@GetMapping("/reviews")
    //	@ResponseStatus(HttpStatus.ACCEPTED)
    //	@JsonView(View.Basic.class)
    //	public SearchReviewResponse<?> searchReview(@RequestParam(defaultValue = "-1") Long
    //	reviewerId,
    //			@RequestParam ReviewType type, @RequestParam Long id, @RequestParam(defaultValue =
    //			"Default") String sort,
    //			@RequestParam(defaultValue = "desc") String sortOrder, @RequestParam(defaultValue =
    //			"1") int page,
    //			@RequestParam(defaultValue = "20") int limit) {
    //
    //		switch (type) {
    //		case POST_REVIEW:
    //			return searchService.searchPostReview(id, sort, sortOrder, limit, page,
    //			reviewerId);
    //		case PROFILE_REVIEW:
    //			return searchService.serachProfileReview(id, sort, sortOrder, limit, page);
    //		default:
    //			throw new BadRequest("invalid review type request!");
    //		}
    //	}
    //
}
