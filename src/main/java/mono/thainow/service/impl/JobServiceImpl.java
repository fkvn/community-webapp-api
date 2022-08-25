package mono.thainow.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.JobDao;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.post.job.Job;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.JobRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.JobService;
import mono.thainow.service.LocationService;
import mono.thainow.service.StorageService;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private LocationService locationService;

	@Autowired
	private JobDao jobDao;

	@Autowired
	private StorageService storageService;

	@Override
	public Job getJobFromRequest(JobRequest request) {

		Job job = new Job();

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse("");
		Assert.isTrue(!title.isEmpty(), "Job title is required!");
		job.setTitle(title);

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse("");
		String address = Optional.ofNullable(request.getAddress()).orElse("");
		Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Job location is required!");
		job.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));

//		cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(new ArrayList<>());
		Assert.isTrue(pictureRequests.size() > 0, "Job picture is required!");
		List<Storage> pictures = storageService.getStoragesFromStorageRequests(pictureRequests);
		Assert.isTrue(pictures.size() > 0, "Job picture is required!");
		job.setPictures(pictures);
		
//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(new HashMap<>());
		Assert.isTrue(contactInfo.size() > 0, "Job contact information is required!");
		job.setContactInfo(contactInfo);

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			job.setDescription(description);
		}

//		positions
		List<String> positions = Optional.ofNullable(request.getPositions()).orElse(null);
		if (positions != null && positions.size() > 0) {
			job.setPositions(positions);
		}
		
//		salary
		String salary = Optional.ofNullable(request.getSalary()).orElse(null);
		if (salary != null) {
			job.setSalary(salary);
		}
		
//		salary
		String skills = Optional.ofNullable(request.getSkills()).orElse(null);
		if (skills != null) {
			job.setSkills(skills);
		}

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		if (expiredOn != null) {
			job.setExpiredOn(expiredOn);
		}

//		job status
		job.setStatus(PostStatus.AVAILABLE);

		return job;
	}

	@Override
	public Job createJob(JobRequest request) {
		return saveJob(getJobFromRequest(request));
	}

	@Override
	public Job saveJob(Job job) {
		return jobDao.saveJob(job);
	}

	@Override
	public Job getJobFromUpdateRequest(Job job, JobRequest request) {

//		title
		String title = Optional.ofNullable(request.getTitle()).orElse(null);
		if (title != null) {
			job.setTitle(title);
		}
		Assert.isTrue(!job.getTitle().isEmpty(), "Job title is required!");

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
		String address = Optional.ofNullable(request.getAddress()).orElse(null);
		Assert.isTrue(address != null ? placeid != null ? true : false : placeid == null ? true : false,
				"Invalid Location");
		if (placeid != null && address != null) {
			Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Job location is required!");
			job.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));
		}

//		new cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
		List<Storage> pictures = storageService.getStoragesFromStorageRequests(pictureRequests);
		if (pictures != null) {
			job.setPictures(pictures);
		}
		Assert.isTrue(job.getPictures().size() > 0, "Job picture is required!");
		
//		contact information
		Map<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(null);
		if (contactInfo != null && contactInfo.size() > 0) {
			job.setContactInfo(contactInfo);
		}

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			job.setDescription(description);
		}

//		positions
		List<String> positions = Optional.ofNullable(request.getPositions()).orElse(null);
		if (positions != null && positions.size() > 0) {
			job.setPositions(positions);
		}
		
//		salary
		String salary = Optional.ofNullable(request.getSalary()).orElse(null);
		if (salary != null) {
			job.setSalary(salary);
		}
		
//		salary
		String skills = Optional.ofNullable(request.getSkills()).orElse(null);
		if (skills != null) {
			job.setSkills(skills);
		}

//		expiration Date
		Date expiredOn = Optional.ofNullable(request.getExpiredOn()).orElse(null);
		if (expiredOn != null) {
			job.setExpiredOn(expiredOn);
		}

//		job status
		PostStatus status = Optional.ofNullable(request.getStatus()).orElse(null);
		if (status != null) {
			Assert.isTrue(status == PostStatus.AVAILABLE || status == PostStatus.PRIVATE, "Invalid Post Status");
			job.setStatus(status);
		}

		return job;
	}

	@Override
	public void remove(Job job) {
		job.setStatus(PostStatus.DELETED);
		saveJob(job);
	}

	
	@Override
	public void updateJob(Job job, JobRequest request) {
		job = getJobFromUpdateRequest(job, request);
		saveJob(job);
	}

	@Override
	public void disableJob(Job job) {
		job.setStatus(PostStatus.DISABLED);
		saveJob(job);
	}

	@Override
	public void activateJob(Job job) {
		job.setStatus(PostStatus.PRIVATE);
		saveJob(job);
	}

}
