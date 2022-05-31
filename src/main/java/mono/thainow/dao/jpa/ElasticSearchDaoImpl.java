package mono.thainow.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.search.engine.search.query.SearchResult;
import org.hibernate.search.mapper.orm.Search;
import org.hibernate.search.mapper.orm.massindexing.MassIndexer;
import org.hibernate.search.mapper.orm.session.SearchSession;
import org.springframework.stereotype.Repository;

import mono.thainow.dao.ElasticSearchDao;
import mono.thainow.domain.company.Company;

@Repository
public class ElasticSearchDaoImpl implements ElasticSearchDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public void reIndexPersistedData(String className) {

		SearchSession searchSession = Search.session(entityManager);

		MassIndexer indexer = null;

		switch (className) {
		case "Company":
			indexer = searchSession.massIndexer(Company.class).threadsToLoadObjects(7);
			break;
		}

		if (indexer != null) {
			try {
				indexer.startAndWait();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			System.out.println("Invalid Class");
		}

	}

	@Override
	public List<Company> searchCompany(String keywords, boolean fetchAll, int fetchLimit) {

		List<Company> companies = new ArrayList<>();

		SearchSession searchSession = Search.session(entityManager);

		companies = searchSession.search(Company.class).where(f -> f.match().fields("name").matching(keywords))
				.fetchHits(fetchAll ? null : fetchLimit);

		return companies;

	}

}
