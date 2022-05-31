package mono.thainow.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.ElasticSearchDao;
import mono.thainow.service.FullTextSearchService;

@Service
public class FullTextSearchServiceImpl implements FullTextSearchService {
	
	@Autowired
	private ElasticSearchDao elasticSearchDao;

	@Override
	public void reIndexPersistedData(String className) {
		elasticSearchDao.reIndexPersistedData(className);
	}


}
