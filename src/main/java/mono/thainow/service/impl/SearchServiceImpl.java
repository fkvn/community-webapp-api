package mono.thainow.service.impl;

import java.util.List;

import org.hibernate.search.engine.search.query.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.SearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.rest.response.SearchResponse;
import mono.thainow.service.ProfileService;
import mono.thainow.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao searchDao;

	@Autowired
	private ProfileService profileService;

	@Override
	public SearchResponse<Company> searchCompany(String industry, String keywords, double centerLat, double centerLng,
			int limit, int page, String sort, String within, int radius, List<Double> topLeft,
			List<Double> bottomRight) {

		SearchResult<Company> result = searchDao.searchCompany(keywords, limit, page, centerLat, centerLng, industry,
				sort, within, radius, topLeft, bottomRight);

		SearchResponse<Company> searchRes = new SearchResponse<Company>();
		searchRes.setTotalCount(result.total().hitCountLowerBound());
		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);

		List<Company> companies = result.hits();

		companies.forEach(com -> {
			if (com.getStatus() == CompanyStatus.REGISTERED) {
				com.setProfileId(profileService.getValidCompanyProfile(com).getId());
			}
		});

		searchRes.setFetchResult(result.hits());

		return searchRes;
	}

}
