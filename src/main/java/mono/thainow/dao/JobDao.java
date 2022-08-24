package mono.thainow.dao;

import mono.thainow.domain.post.job.Job;

public interface JobDao {
	Job saveJob(Job job);
}
