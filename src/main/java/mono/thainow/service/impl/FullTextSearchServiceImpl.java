package mono.thainow.service.impl;

import mono.thainow.dao.SearchDao;
import mono.thainow.service.FullTextSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FullTextSearchServiceImpl implements FullTextSearchService {

    @Autowired
    private SearchDao elasticSearchDao;

    @Override
    public void reIndexPersistedData(String className) {
        elasticSearchDao.reIndexPersistedData(className);
    }

    @Override
    public void reIndexPersistedData(List<String> className) {
        elasticSearchDao.reIndexPersistedData(className);
    }


}
