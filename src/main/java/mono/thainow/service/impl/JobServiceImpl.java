package mono.thainow.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.TreeMap;
import java.util.TreeSet;

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
		String title = Optional.ofNullable(request.getTitle()).orElse("").trim();
		Assert.isTrue(!title.isEmpty(), "Job title is required!");
		job.setTitle(title);

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse("").trim();
		String address = Optional.ofNullable(request.getAddress()).orElse("").trim();
		Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Job location is required!");
		job.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid, address));

//		cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(new ArrayList<>());
		Assert.isTrue(pictureRequests.size() > 0, "Job picture is required!");
		List<Storage> pictures = storageService.getStoragesFromStorageRequests(pictureRequests);
		Assert.isTrue(pictures.size() > 0, "Job picture is required!");
		job.setPictures(pictures);

//		contact information
		TreeMap<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(new TreeMap<>(String.CASE_INSENSITIVE_ORDER));
		Assert.isTrue(contactInfo.size() > 0, "Job contact information is required!");
		job.setContactInfo(contactInfo);
		
//		remote job
		Boolean isRemote = Optional.ofNullable(request.getIsRemote()).orElse(null);
		if (isRemote != null) {
			job.setRemote(isRemote);
		}

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			job.setDescription(description.trim());
		}

//		positions
		TreeSet<String> positions = Optional.ofNullable(request.getPositions()).orElse(null);
		if (positions != null && positions.size() > 0) {
			job.setPositions(positions);
		}

//		experience
		String experience = Optional.ofNullable(request.getExperience()).orElse(null);
		if (experience != null) {
			job.setExperience(experience.trim());
		}

//		salary
		String salary = Optional.ofNullable(request.getSalary()).orElse(null);
		if (salary != null) {
			job.setSalary(salary.trim());
		}

//		skills
		String skills = Optional.ofNullable(request.getSkills()).orElse(null);
		if (skills != null) {
			job.setSkills(skills.trim());
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
			job.setTitle(title.trim());
		}
		Assert.isTrue(!job.getTitle().isEmpty(), "Job title is required!");

//		location
		String placeid = Optional.ofNullable(request.getPlaceid()).orElse(null);
		String address = Optional.ofNullable(request.getAddress()).orElse(null);
		Assert.isTrue(address != null ? placeid != null ? true : false : placeid == null ? true : false,
				"Invalid Location");
		if (placeid != null && address != null) {
			Assert.isTrue(!placeid.isEmpty() && !address.isEmpty(), "Job location is required!");
			job.setLocation(locationService.getLocationFromPlaceidAndAddress(placeid.trim(), address.trim()));
		}

//		new cover pictures
		List<StorageRequest> pictureRequests = Optional.ofNullable(request.getPictures()).orElse(null);
		List<Storage> pictures = storageService.getStoragesFromStorageRequests(pictureRequests);
		if (pictures != null) {
			job.setPictures(pictures);
		}
		Assert.isTrue(job.getPictures().size() > 0, "Job picture is required!");

//		contact information
		TreeMap<String, String> contactInfo = Optional.ofNullable(request.getContactInfo()).orElse(null);
		if (contactInfo != null && contactInfo.size() > 0) {
			job.setContactInfo(contactInfo);
		}
		
//		remote job
		Boolean isRemote = Optional.ofNullable(request.getIsRemote()).orElse(null);
		if (isRemote != null) {
			job.setRemote(isRemote);
		}

//		description
		String description = Optional.ofNullable(request.getDescription()).orElse(null);
		if (description != null) {
			job.setDescription(description.trim());
		}

//		positions
		TreeSet<String> positions = Optional.ofNullable(request.getPositions()).orElse(null);
		if (positions != null && positions.size() > 0) {
			job.setPositions(positions);
		}

//		experience
		String experience = Optional.ofNullable(request.getExperience()).orElse(null);
		if (experience != null) {
			job.setExperience(experience.trim());
		}

//		salary
		String salary = Optional.ofNullable(request.getSalary()).orElse(null);
		if (salary != null) {
			job.setSalary(salary.trim());
		}

//		skills
		String skills = Optional.ofNullable(request.getSkills()).orElse(null);
		if (skills != null) {
			job.setSkills(skills.trim());
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
