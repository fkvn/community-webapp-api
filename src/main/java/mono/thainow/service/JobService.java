package mono.thainow.service;

import mono.thainow.domain.post.job.Job;
import mono.thainow.rest.request.JobRequest;

public interface JobService {

	Job getJobFromRequest(JobRequest request);

	Job createJob(JobRequest request);
	
	Job saveJob(Job job);

	Job getJobFromUpdateRequest(Job job, JobRequest request);

	void remove(Job job);

	void updateJob(Job job, JobRequest request);

	void disableJob(Job job);

	void activateJob(Job job);
}
