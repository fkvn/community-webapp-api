package mono.thainow.dao.jpa;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.search.mapper.orm.Search;
import org.hibernate.search.mapper.orm.massindexing.MassIndexer;
import org.hibernate.search.mapper.orm.session.SearchSession;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import mono.thainow.dao.ElasticSearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;

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
		}

		Assert.isTrue(indexer != null, "Index Failed!");

	}

	@Override
	public List<Company> searchCompanyByNameOnly(String keywords, boolean fetchAll, int fetchLimit) {

		List<Company> companies = new ArrayList<>();

		SearchSession searchSession = Search.session(entityManager);

		companies = searchSession.search(Company.class).where(f -> f.phrase().fields("name").matching(keywords).slop(2))
				.fetchHits(fetchAll ? null : fetchLimit).stream()
//				in default, we only return company with status as Registered and Unregistered
				.filter(company -> company.getStatus() != CompanyStatus.REJECTED).collect(Collectors.toList());

		return companies;

	}

}
