package mono.thainow.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.service.FullTextSearchService;

@RestController
//@PreAuthorize("hasAnyAuthority('COMPANY_MANAGE')")
@RequestMapping("/api/search")
public class FullTextSearchController {
	
	@Autowired
	private FullTextSearchService fulltextSearchService;
	
	@PostMapping("/reindex")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void createCompany(@RequestParam String className) {
		fulltextSearchService.reIndexPersistedData(className);
	}
	
}
