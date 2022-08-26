package mono.thainow.dao.jpa;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.search.engine.spatial.GeoPoint;
import org.hibernate.search.mapper.orm.Search;
import org.hibernate.search.mapper.orm.massindexing.MassIndexer;
import org.hibernate.search.mapper.orm.session.SearchSession;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import mono.thainow.dao.SearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.location.Location;

@Repository
public class SearchDaoImpl implements SearchDao {

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
		case "Location":
			indexer = searchSession.massIndexer(Location.class).threadsToLoadObjects(7);
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

	@Override
	public List<Company> searchCompany(String keywords, int limit, int page, Location locationCenter) {

		List<Company> companies = new ArrayList<>();

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(locationCenter.getLat(), locationCenter.getLng());

		companies = searchSession.search(Company.class).where(f -> f.bool(b -> {
//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("name").boost(3.0f).field("industry").boost(2.0f).field("description")
						.boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("status").matchingAny(CompanyStatus.REGISTERED, CompanyStatus.UNREGISTERED));
		}

		)).sort(f -> f.distance("companyLocation", center)).fetchHits(limit * page, limit);

		return companies;
	}

}
