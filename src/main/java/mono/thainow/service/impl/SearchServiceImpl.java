package mono.thainow.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.SearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;
import mono.thainow.rest.controller.SearchService;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchDao searchDao;

	@Override
	public List<Company> searchCompany(String keywords, int limit, int page, Location center) {
		return searchDao.searchCompany(keywords, limit, page, center);
	}

}
