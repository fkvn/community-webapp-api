package mono.thainow.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.domain.company.Company;
import mono.thainow.rest.request.SearchRequest;
import mono.thainow.service.CompanyService;
import mono.thainow.service.FullTextSearchService;
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
	public List<Company> SearchCompanies(@RequestBody SearchRequest request) {
		return searchService.searchCompany(request.getKeywords(), request.getLimit(), request.getPage(),
				request.getCenter());
	}

}
