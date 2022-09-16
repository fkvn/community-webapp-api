package mono.thainow.dao.jpa;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.search.engine.search.aggregation.AggregationKey;
import org.hibernate.search.engine.search.common.SortMode;
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
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.deal.Deal;
import mono.thainow.domain.post.deal.DealPost;
import mono.thainow.domain.post.housing.Housing;
import mono.thainow.domain.post.housing.HousingPost;
import mono.thainow.domain.post.job.Job;
import mono.thainow.domain.post.job.JobPost;
import mono.thainow.domain.post.marketplace.Marketplace;
import mono.thainow.domain.post.marketplace.MarketplacePost;
import mono.thainow.domain.profile.CompanyProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.PostReview;
import mono.thainow.domain.review.ProfileReview;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.review.ReviewStatus;

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
		case "Housing":
			indexer = searchSession.massIndexer(Housing.class).threadsToLoadObjects(7);
			break;
		case "Post":
			indexer = searchSession.massIndexer(Post.class).threadsToLoadObjects(7);
			break;
		case "Review":
			indexer = searchSession.massIndexer(Review.class).threadsToLoadObjects(7);
			break;
		case "Profile":
			indexer = searchSession.massIndexer(Profile.class).threadsToLoadObjects(7);
			break;

		}

		if (indexer != null) {
			try {
				indexer.startAndWait();
			} catch (InterruptedException e) {
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
			default:
				b.must(f.spatial().within().field("location").circle(center, radius, DistanceUnit.MILES));
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
			default:
				b.must(f.spatial().within().field("location").circle(center, radius, DistanceUnit.MILES));
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
			default:
				b.must(f.spatial().within().field("location").circle(center, radius, DistanceUnit.MILES));
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

	@Override
	public SearchResult<Housing> searchHousing(String keywords, String type, String costType, Double minCost,
			Double maxCost, Integer guest, Integer bed, Integer parking, Integer bath, String amenity, String category,
			double centerLat, double centerLng, int limit, int page, String sort, String within, int radius,
			List<Double> topLeft, List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<Housing> housings = searchSession.search(Housing.class).where(f -> f.bool(b -> {

//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("title").boost(2.0f).field("category_search").boost(4.0f).field("type_search")
						.boost(3.0f).field("description").boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("status").matchingAny(PostStatus.AVAILABLE));

//			guess filter
			if (guest > 0) {
				b.filter(f.range().field("interiorObj.guest").atLeast(guest));
			}

//			bed filter
			if (bed > 0) {
				b.filter(f.range().field("interiorObj.bed").atLeast(bed));
			}

//			bath filter
			if (bath > 0) {
				b.filter(f.range().field("interiorObj.bath").atLeast(bath));
			}

//			parking filter
			if (parking > 0) {
				b.filter(f.range().field("interiorObj.parking").atLeast(parking));
			}

//			type filter
			if (!type.isEmpty() && !type.equals("All")) {
				b.filter(f.match().field("type").matching(type));
			}

//			costType filter
			Double maxCostRange = maxCost > 0 ? maxCost : null;
			Double minCostRange = minCost > 0 ? minCost : null;

			switch (costType) {
			case "Daily":
				b.filter(f.range().field("dailyCost").between(minCostRange, maxCostRange));
				break;

			case "Monthly":
				b.filter(f.range().field("monthlyCost").between(minCostRange, maxCostRange));
				break;

			case "Annual":
				b.filter(f.range().field("annualCost").between(minCostRange, maxCostRange));
				break;

			case "Deposit":
				b.filter(f.range().field("depositCost").between(minCostRange, maxCostRange));
				break;
			}

//			amenity filter
			if (!amenity.isEmpty() && !amenity.equals("All")) {
				b.filter(f.match().field("amenities").matching(amenity));
			}

//			category filter
			if (!category.isEmpty() && !category.equals("All")) {
				b.filter(f.match().field("category").matching(category));
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
			default:
				b.must(f.spatial().within().field("location").circle(center, radius, DistanceUnit.MILES));
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

		return housings;
	}

	@Override
	public SearchResult<Marketplace> searchMarketplace(String keywords, String condition, String category,
			Double minCost, Double maxCost, double centerLat, double centerLng, int limit, int page, String sort,
			String within, int radius, List<Double> topLeft, List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<Marketplace> marketplace = searchSession.search(Marketplace.class).where(f -> f.bool(b -> {

//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("title").boost(2.0f).field("category_search").boost(4.0f)
						.field("condition_search").boost(3.0f).field("description").boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("status").matchingAny(PostStatus.AVAILABLE));

//			costType filter
			Double maxCostRange = maxCost > 0 ? maxCost : null;
			Double minCostRange = minCost > 0 ? minCost : null;
			b.filter(f.range().field("cost").between(minCostRange, maxCostRange));

//			amenity filter
			if (!condition.isEmpty() && !condition.equals("All")) {
				b.filter(f.match().field("condition").matching(condition));
			}

//			category filter
			if (!category.isEmpty() && !category.equals("All")) {
				b.filter(f.match().field("category").matching(category));
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
			default:
				b.must(f.spatial().within().field("location").circle(center, radius, DistanceUnit.MILES));
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

		return marketplace;
	}

	@Override
	public SearchResult<DealPost> searchDealPost(String keywords, int limit, int page, double centerLat,
			double centerLng, String category, String sort, String within, int radius, List<Double> topLeft,
			List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<DealPost> deals = searchSession.search(DealPost.class).where(f -> f.bool(b -> {

//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("deal.title").boost(3.0f).field("deal.category_search").boost(2.0f)
						.field("deal.description").boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("deal.status").matchingAny(PostStatus.AVAILABLE));
//
//			category filter
			if (!category.isEmpty() && !category.equals("All")) {
				b.filter(f.match().field("deal.category").matching(category));
			}
//
//			radius default 20 miles
			switch (within) {
			case "circle":
				b.must(f.spatial().within().field("deal.location").circle(center, radius, DistanceUnit.MILES));
				break;
			case "box": {
				GeoBoundingBox box = GeoBoundingBox.of(topLeft.get(0), topLeft.get(1), bottomRight.get(0),
						bottomRight.get(1));

				b.must(f.spatial().within().field("deal.location").boundingBox(box));
			}
				break;
			default:
				b.must(f.spatial().within().field("deal.location").circle(center, radius, DistanceUnit.MILES));
				break;
			}

		})).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("deal.updatedOn").desc());
				break;
			case "Distance":
				b.add(f.distance("deal.location", center));
				break;
			default:
//				default, score, or other qualities
				b.add(f.field("deal.updatedOn").desc());
				break;
			}
		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return deals;
	}

	@Override
	public SearchResult<HousingPost> searchHousingPost(String keywords, String type, String costType, Double minCost,
			Double maxCost, Integer guest, Integer bed, Integer parking, Integer bath, String amenity, String category,
			double centerLat, double centerLng, int limit, int page, String sort, String within, int radius,
			List<Double> topLeft, List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<HousingPost> housings = searchSession.search(HousingPost.class).where(f -> f.bool(b -> {

//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("housing.title").boost(2.0f).field("housing.category_search").boost(4.0f)
						.field("housing.type_search").boost(3.0f).field("housing.description").boost(1.0f)
						.matching(keywords));
			}

//			status
			b.must(f.terms().field("housing.status").matchingAny(PostStatus.AVAILABLE));

//			guess filter
			if (guest > 0) {
				b.filter(f.range().field("housing.interiorObj.guest").atLeast(guest));
			}

//			bed filter
			if (bed > 0) {
				b.filter(f.range().field("housing.interiorObj.bed").atLeast(bed));
			}

//			bath filter
			if (bath > 0) {
				b.filter(f.range().field("housing.interiorObj.bath").atLeast(bath));
			}

//			parking filter
			if (parking > 0) {
				b.filter(f.range().field("housing.interiorObj.parking").atLeast(parking));
			}

//			type filter
			if (!type.isEmpty() && !type.equals("All")) {
				b.filter(f.match().field("housing.type").matching(type));
			}

//			costType filter
			Double maxCostRange = maxCost > 0 ? maxCost : null;
			Double minCostRange = minCost > 0 ? minCost : null;

			switch (costType) {
			case "Daily":
				b.filter(f.range().field("housing.dailyCost").between(minCostRange, maxCostRange));
				break;

			case "Monthly":
				b.filter(f.range().field("housing.monthlyCost").between(minCostRange, maxCostRange));
				break;

			case "Annual":
				b.filter(f.range().field("housing.annualCost").between(minCostRange, maxCostRange));
				break;

			case "Deposit":
				b.filter(f.range().field("housing.depositCost").between(minCostRange, maxCostRange));
				break;
			}

//			amenity filter
			if (!amenity.isEmpty() && !amenity.equals("All")) {
				b.filter(f.match().field("housing.amenities").matching(amenity));
			}

//			category filter
			if (!category.isEmpty() && !category.equals("All")) {
				b.filter(f.match().field("housing.category").matching(category));
			}

//			radius default 20 miles
			switch (within) {
			case "circle":
				b.must(f.spatial().within().field("housing.location").circle(center, radius, DistanceUnit.MILES));
				break;
			case "box": {
				GeoBoundingBox box = GeoBoundingBox.of(topLeft.get(0), topLeft.get(1), bottomRight.get(0),
						bottomRight.get(1));

				b.must(f.spatial().within().field("housing.location").boundingBox(box));
			}
				break;
			default:
				b.must(f.spatial().within().field("housing.location").circle(center, radius, DistanceUnit.MILES));
				break;
			}

		})).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("housing.updatedOn").desc());
				break;
			case "Distance":
				b.add(f.distance("housing.location", center));
				break;
			default:
//				default, score, or other qualities
				b.add(f.field("housing.updatedOn").desc());
				break;
			}
		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return housings;
	}

	@Override
	public SearchResult<JobPost> searchJobPost(String keywords, String position, String experience, String skills,
			Boolean remote, int limit, int page, double centerLat, double centerLng, String sort, String within,
			int radius, List<Double> topLeft, List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<JobPost> jobs = searchSession.search(JobPost.class).where(f -> f.bool(b -> {

//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("job.title").boost(3.0f).field("job.positions").boost(2.0f)
						.field("job.description").boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("job.status").matchingAny(PostStatus.AVAILABLE));

//			position filter
			if (!position.isEmpty() && !position.equals("All")) {
				b.filter(f.match().field("job.positions").matching(position));
			}

//			experience filter
			if (!experience.isEmpty() && !experience.equals("All")) {
				b.filter(f.match().field("job.experience").matching(experience));
			}

//			skills filter
			if (!skills.isEmpty() && !skills.equals("All")) {
				b.filter(f.match().field("job.skills").matching(skills));
			}

//			remote filter
			if (remote) {
				b.filter(f.match().field("job.remote").matching(remote));
			}

//			radius default 20 miles
			switch (within) {
			case "circle":
				b.must(f.spatial().within().field("job.location").circle(center, radius, DistanceUnit.MILES));
				break;
			case "box": {
				GeoBoundingBox box = GeoBoundingBox.of(topLeft.get(0), topLeft.get(1), bottomRight.get(0),
						bottomRight.get(1));

				b.must(f.spatial().within().field("job.location").boundingBox(box));
			}
				break;
			default:
				b.must(f.spatial().within().field("job.location").circle(center, radius, DistanceUnit.MILES));
				break;
			}

		})).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("job.updatedOn").desc());
				break;
			case "Distance":
				b.add(f.distance("job.location", center));
				break;
			case "Rating":
				b.add(f.field("reviews.rate").mode(SortMode.AVG));
				break;
			default:
//				default, score, or other qualities
				b.add(f.field("job.updatedOn").desc());
				break;
			}
		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return jobs;
	}

	@Override
	public SearchResult<MarketplacePost> searchMarketplacePost(String keywords, String condition, String category,
			Double minCost, Double maxCost, double centerLat, double centerLng, int limit, int page, String sort,
			String within, int radius, List<Double> topLeft, List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<MarketplacePost> marketplaces = searchSession.search(MarketplacePost.class)
				.where(f -> f.bool(b -> {

//			keywords
					if (!keywords.isEmpty()) {
						b.must(f.match().field("marketplace.title").boost(2.0f).field("marketplace.category_search")
								.boost(4.0f).field("marketplace.condition_search").boost(3.0f)
								.field("marketplace.description").boost(1.0f).matching(keywords));
					}

//			status
					b.must(f.terms().field("marketplace.status").matchingAny(PostStatus.AVAILABLE));

//			costType filter
					Double maxCostRange = maxCost > 0 ? maxCost : null;
					Double minCostRange = minCost > 0 ? minCost : null;
					b.filter(f.range().field("marketplace.cost").between(minCostRange, maxCostRange));

//			amenity filter
					if (!condition.isEmpty() && !condition.equals("All")) {
						b.filter(f.match().field("marketplace.condition").matching(condition));
					}

//			category filter
					if (!category.isEmpty() && !category.equals("All")) {
						b.filter(f.match().field("marketplace.category").matching(category));
					}

//			radius default 20 miles
					switch (within) {
					case "circle":
						b.must(f.spatial().within().field("marketplace.location").circle(center, radius,
								DistanceUnit.MILES));
						break;
					case "box": {
						GeoBoundingBox box = GeoBoundingBox.of(topLeft.get(0), topLeft.get(1), bottomRight.get(0),
								bottomRight.get(1));

						b.must(f.spatial().within().field("marketplace.location").boundingBox(box));
					}
						break;
					default:
						b.must(f.spatial().within().field("marketplace.location").circle(center, radius,
								DistanceUnit.MILES));
						break;
					}

				})).sort(f -> f.composite(b -> {
					switch (sort) {
					case "Date":
						b.add(f.field("marketplace.updatedOn").desc());
						break;
					case "Distance":
						b.add(f.distance("marketplace.location", center));
						break;
					default:
//				default, score, or other qualities
						b.add(f.field("marketplace.updatedOn").desc());
						break;
					}
				})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return marketplaces;
	}

	@Override
	public SearchResult<CompanyProfile> searchCompanyProfile(String keywords, int limit, int page, double centerLat,
			double centerLng, String industry, String sort, String within, int radius, List<Double> topLeft,
			List<Double> bottomRight) {

		SearchSession searchSession = Search.session(entityManager);

		GeoPoint center = GeoPoint.of(centerLat, centerLng);

		SearchResult<CompanyProfile> companies = searchSession.search(CompanyProfile.class).where(f -> f.bool(b -> {
//			keywords
			if (!keywords.isEmpty()) {
				b.must(f.match().field("company.name").boost(3.0f).field("company.industry").boost(2.0f)
						.field("company.description").boost(1.0f).matching(keywords));
			}

//			status
			b.must(f.terms().field("company.status").matchingAny(CompanyStatus.REGISTERED, CompanyStatus.UNREGISTERED));

//			industry filter
			if (!industry.isEmpty() && !industry.equals("All")) {
				b.filter(f.match().field("company.industry").matching(industry));
			}

//			radius default 20 miles
			switch (within) {
			case "circle":
				b.must(f.spatial().within().field("company.location").circle(center, radius, DistanceUnit.MILES));
				break;
			case "box": {
				GeoBoundingBox box = GeoBoundingBox.of(topLeft.get(0), topLeft.get(1), bottomRight.get(0),
						bottomRight.get(1));

				b.must(f.spatial().within().field("company.location").boundingBox(box));
			}
				break;
			default:
				b.must(f.spatial().within().field("company.location").circle(center, radius, DistanceUnit.MILES));
				break;
			}

		})).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("company.updatedOn").desc());
				break;
			case "Distance":
				b.add(f.distance("company.location", center));
				break;
			case "Rating":
				b.add(f.field("reviews.rate").mode(SortMode.AVG));
				break;
			default:
//				score, or other qualities
				b.add(f.field("company.updatedOn").desc());
				break;
			}

		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return companies;
	}

	@Override
	public SearchResult<PostReview> searchPostReview(Long postId, String sort, int limit, int page,
			AggregationKey<Map<Integer, Long>> aggregationKey, Long reviewerId) {

		SearchSession searchSession = Search.session(entityManager);

		SearchResult<PostReview> reviews = searchSession.search(PostReview.class).where(f -> f.bool(b -> {

//			post id
			b.must(f.match().field("post.id").matching(postId));

//			status
			b.must(f.terms().field("status").matchingAny(ReviewStatus.ACTIVATED));


		})).aggregation(aggregationKey, f -> f.terms().field("rate", Integer.class)).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("updatedOn").desc());
				break;
			case "Rating":
				b.add(f.field("rate").desc());
				break;
			default:
//				score, or other qualities
				b.add(f.field("updatedOn").desc());
				break;
			}

		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return reviews;
	}

	@Override
	public SearchResult<ProfileReview> searchProfileReview(Long profileId, String sort, int limit, int page,
			AggregationKey<Map<Integer, Long>> aggregationKey) {

		SearchSession searchSession = Search.session(entityManager);

		SearchResult<ProfileReview> reviews = searchSession.search(ProfileReview.class).where(f -> f.bool(b -> {

//			profile id
			b.must(f.match().field("profile.revieweeId").matching(profileId));

//			status
			b.must(f.terms().field("status").matchingAny(ReviewStatus.ACTIVATED));

		})).aggregation(aggregationKey, f -> f.terms().field("rate", Integer.class)).sort(f -> f.composite(b -> {
			switch (sort) {
			case "Date":
				b.add(f.field("updatedOn").desc());
				break;
			case "Rating":
				b.add(f.field("rate").desc());
				break;
			default:
//				score, or other qualities
				b.add(f.field("updatedOn").desc());
				break;
			}

		})).totalHitCountThreshold(500).fetch(limit * (page - 1), limit);

		return reviews;
	}

}
