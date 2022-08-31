package mono.thainow.dao.jpa;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.search.engine.search.query.SearchResult;
import org.hibernate.search.engine.spatial.DistanceUnit;
import org.hibernate.search.engine.spatial.GeoBoundingBox;
import org.hibernate.search.engine.spatial.GeoPoint;
import org.hibernate.search.mapper.orm.Search;
import org.hibernate.search.mapper.orm.massindexing.MassIndexer;
import org.hibernate.search.mapper.orm.session.SearchSession;
import org.springframework.stereotype.Repository;
import org.springframework.util.Assert;

import mono.thainow.dao.SearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.deal.Deal;
import mono.thainow.domain.post.job.Job;

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
		case "Deal":
			indexer = searchSession.massIndexer(Deal.class).threadsToLoadObjects(7);
			break;
		case "Job":
			indexer = searchSession.massIndexer(Job.class).threadsToLoadObjects(7);
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
	public SearchResult<Company> searchCompany(String keywords, int limit, int page, double centerLat, double centerLng,
			String industry, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<Company> companies = searchSession.search(Company.class).where(f -> f.bool(b -> {
//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("name").boost(3.0f).field("industry").boost(2.0f).field("description")
						.boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("status").matchingAny(CompanyStatus.REGISTERED, CompanyStatus.UNREGISTERED));

//			industry filter
			if (!industry.isEmpty() && !industry.equals("All")) {
				b.filter(f.match().field("industry").matching(industry));
			}

//			radius default 20 miles
			switch (within) {
			case "circle":
				b.must(f.spatial().within().field("location").circle(center, radius, DistanceUnit.MILES));
				break;
			case "box": {
				GeoBoundingBox box = GeoBoundingBox.of(topLeft.get(0), topLeft.get(1), bottomRight.get(0),
						bottomRight.get(1));

				b.must(f.spatial().within().field("location").boundingBox(box));
			}
				break;
			}

		})).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("updatedOn").desc());
				break;
			case "Distance":
				b.add(f.distance("location", center));
				break;
			default:
//				score, or other qualities
				b.add(f.field("updatedOn").desc());
				break;
			}

		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return companies;
	}

	@Override
	public SearchResult<Deal> searchDeal(String keywords, int limit, int page, double centerLat, double centerLng,
			String category, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<Deal> deals = searchSession.search(Deal.class).where(f -> f.bool(b -> {

//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("title").boost(3.0f).field("category_search").boost(2.0f).field("description")
						.boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("status").matchingAny(PostStatus.AVAILABLE));
//
//			category filter
			if (!category.isEmpty() && !category.equals("All")) {
				b.filter(f.match().field("category").matching(category));
			}
//
//			radius default 20 miles
			switch (within) {
			case "circle":
				b.must(f.spatial().within().field("location").circle(center, radius, DistanceUnit.MILES));
				break;
			case "box": {
				GeoBoundingBox box = GeoBoundingBox.of(topLeft.get(0), topLeft.get(1), bottomRight.get(0),
						bottomRight.get(1));

				b.must(f.spatial().within().field("location").boundingBox(box));
			}
				break;
			}

		})).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("updatedOn").desc());
				break;
			case "Distance":
				b.add(f.distance("location", center));
				break;
			default:
//				default, score, or other qualities
				b.add(f.field("updatedOn").desc());
				break;
			}
		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return deals;
	}

	@Override
	public SearchResult<Job> searchJob(String keywords, String position, String experience, String skills,
			Boolean remote, int limit, int page, double centerLat, double centerLng, String sort, String within,
			int radius, List<Double> topLeft, List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<Job> jobs = searchSession.search(Job.class).where(f -> f.bool(b -> {

//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("title").boost(3.0f).field("positions").boost(2.0f).field("description")
						.boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("status").matchingAny(PostStatus.AVAILABLE));

//			position filter
			if (!position.isEmpty() && !position.equals("All")) {
				b.filter(f.match().field("positions").matching(position));
			}
			
//			experience filter
			if (!experience.isEmpty() && !experience.equals("All")) {
				b.filter(f.match().field("experience").matching(experience));
			}
			
//			skills filter
			if (!skills.isEmpty() && !skills.equals("All")) {
				b.filter(f.match().field("skills").matching(skills));
			}
			
//			remote filter
			if (remote) {
				b.filter(f.match().field("remote").matching(remote));
			}


//			radius default 20 miles
			switch (within) {
			case "circle":
				b.must(f.spatial().within().field("location").circle(center, radius, DistanceUnit.MILES));
				break;
			case "box": {
				GeoBoundingBox box = GeoBoundingBox.of(topLeft.get(0), topLeft.get(1), bottomRight.get(0),
						bottomRight.get(1));

				b.must(f.spatial().within().field("location").boundingBox(box));
			}
				break;
			}

		})).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("updatedOn").desc());
				break;
			case "Distance":
				b.add(f.distance("location", center));
				break;
			default:
//				default, score, or other qualities
				b.add(f.field("updatedOn").desc());
				break;
			}
		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return jobs;
	}

}