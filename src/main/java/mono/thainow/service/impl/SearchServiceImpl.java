package mono.thainow.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.hibernate.search.engine.search.query.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mono.thainow.dao.SearchDao;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostType;
import mono.thainow.domain.post.deal.Deal;
import mono.thainow.domain.post.job.Job;
import mono.thainow.rest.response.SearchResponse;
import mono.thainow.service.PostService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.SearchService;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchDao searchDao;

	@Autowired
	private ProfileService profileService;

	@Autowired
	private PostService postService;

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

		searchRes.setFetchResult(companies);

		return searchRes;
	}

	@Override
	public SearchResponse<?> searchDeal(String category, String keywords, double centerLat, double centerLng, int limit,
			int page, String sort, String within, int radius, List<Double> topLeft, List<Double> bottomRight) {
		
		SearchResult<Deal> result = searchDao.searchDeal(keywords, limit, page, centerLat, centerLng, category,
				sort, within, radius, topLeft, bottomRight);

		SearchResponse<Post> searchRes = new SearchResponse<Post>();
		searchRes.setTotalCount(result.total().hitCountLowerBound());
		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);

		List<Deal> deals = result.hits();

		List<Post> posts = deals.stream().map(deal -> 
			postService.getValidPost(PostType.DEAL_POST, deal)
		).collect(Collectors.toList());
		
		
		searchRes.setFetchResult(posts);

		return searchRes;
	}

	@Override
	public SearchResponse<?> searchJob(String keywords, String position, String experience, String skills,
			Boolean remote, double centerLat, double centerLng, int limit, int page, String sort, String within,
			int radius, List<Double> topLeft, List<Double> bottomRight) {
		
		SearchResult<Job> result = searchDao.searchJob(keywords, position, experience, skills, remote, limit, page, centerLat, centerLng,
				sort, within, radius, topLeft, bottomRight);

		SearchResponse<Post> searchRes = new SearchResponse<Post>();
		searchRes.setTotalCount(result.total().hitCountLowerBound());
		searchRes.setTotalPage((searchRes.getTotalCount() / limit) + 1);

		List<Job> jobs = result.hits();

		List<Post> posts = jobs.stream().map(job -> 
			postService.getValidPost(PostType.JOB_POST, job)
		).collect(Collectors.toList());
		
		
		searchRes.setFetchResult(posts);

		return searchRes;
	}

}
