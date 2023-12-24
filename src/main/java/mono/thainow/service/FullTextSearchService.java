package mono.thainow.service;

import java.util.List;

public interface FullTextSearchService {

    void reIndexPersistedData(String className);

    void reIndexPersistedData(List<String> className);
}
