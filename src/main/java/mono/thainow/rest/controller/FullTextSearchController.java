package mono.thainow.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.domain.company.Company;
import mono.thainow.rest.response.SearchResponse;
import mono.thainow.service.CompanyService;
import mono.thainow.service.FullTextSearchService;
import mono.thainow.service.SearchService;
import mono.thainow.view.View;

@RestController
//@PreAuthorize("hasAnyAuthority('COMPANY_MANAGE')")
@RequestMapping("/api/search")
public class FullTextSearchController {

	@Autowired
	private FullTextSearchService fulltextSearchService;

	@Autowired
	private CompanyService companyService;

	@Autowired
	private SearchService searchService;

	@PostMapping("/reindex")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void indexCompany(@RequestParam String className) {
		fulltextSearchService.reIndexPersistedData(className);
	}

	@GetMapping("/companies/name")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Basic.class)
	public List<Company> SearchCompanyByName(@RequestParam String keywords, @RequestParam boolean fetchAll,
			@RequestParam int fetchLimit) {
		return companyService.searchCompanyByNameOnly(keywords, fetchAll, fetchLimit);
	}

	@GetMapping("/companies")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Basic.class)
	public SearchResponse<?> SearchCompanies(@RequestParam(defaultValue = "") String keywords,
			@RequestParam(defaultValue = "All") String industry, @RequestParam double centerLat,
			@RequestParam double centerLng, @RequestParam(defaultValue = "Date") String sort,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int limit,
			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue = "20") int radius,
			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {

		return searchService.searchCompany(industry, keywords, centerLat, centerLng, limit, page, sort, within, radius,
				topLeft, bottomRight);
	}
	
	@GetMapping("/deals")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Basic.class)
	public SearchResponse<?> SearchDeals(@RequestParam(defaultValue = "") String keywords,
			@RequestParam(defaultValue = "All") String category, @RequestParam double centerLat,
			@RequestParam double centerLng, @RequestParam(defaultValue = "Date") String sort,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int limit,
			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue = "20") int radius,
			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {

		return searchService.searchDeal(category, keywords, centerLat, centerLng, limit, page, sort, within, radius,
				topLeft, bottomRight);
	}

	@GetMapping("/jobs")
	@ResponseStatus(HttpStatus.ACCEPTED)
	@JsonView(View.Basic.class)
	public SearchResponse<?> SearchJobs(@RequestParam(defaultValue = "") String keywords,
			@RequestParam(defaultValue = "All") String position,
			@RequestParam(defaultValue = "All") String experience,
			@RequestParam(defaultValue = "All") String skills,
			@RequestParam(defaultValue = "false") Boolean remote,
			@RequestParam double centerLat,
			@RequestParam double centerLng, @RequestParam(defaultValue = "Date") String sort,
			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int limit,
			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue = "20") int radius,
			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {

		return searchService.searchJob(keywords, position, experience, skills, remote, centerLat, centerLng, limit, page, sort, within, radius,
				topLeft, bottomRight);
	}
	
//	@GetMapping("/housing")
//	@ResponseStatus(HttpStatus.ACCEPTED)
//	@JsonView(View.Basic.class)
//	public SearchResponse<?> SearchHousing(@RequestParam(defaultValue = "") String keywords,
//			@RequestParam(defaultValue = "All") String type,
//			@RequestParam(defaultValue = "Monthly") String costType,
//			@RequestParam(defaultValue = "0") Long minCost,
//			@RequestParam(defaultValue = "0") Long maxCost,
//			@RequestParam(defaultValue = "0") Integer guest,
//			@RequestParam(defaultValue = "0") Integer bed,
//			@RequestParam(defaultValue = "0") Integer parking,
//			@RequestParam(defaultValue = "0") Integer bath,
////			@RequestParam(defaultValue = "0") String ,
//			@RequestParam(defaultValue = "") List<String> remote,
//			@RequestParam double centerLat,
//			@RequestParam double centerLng, @RequestParam(defaultValue = "Date") String sort,
//			@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "20") int limit,
//			@RequestParam(defaultValue = "circle") String within, @RequestParam(defaultValue = "20") int radius,
//			@RequestParam(defaultValue = "0,0") List<Double> topLeft,
//			@RequestParam(defaultValue = "0, 0") List<Double> bottomRight) {
//
//		return searchService.searchJob(keywords, position, experience, skills, remote, centerLat, centerLng, limit, page, sort, within, radius,
//				topLeft, bottomRight);
//	}

}
