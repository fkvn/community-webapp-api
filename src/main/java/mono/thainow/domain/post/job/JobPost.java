package mono.thainow.domain.post.job;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

import org.hibernate.search.mapper.pojo.automaticindexing.ReindexOnUpdate;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexingDependency;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.profile.Profile;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("JOB_POST")
public class JobPost extends Post {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public JobPost(Profile owner, Job job) {
		this.setOwner(owner);
		this.setJob(job);
	}

	@OneToOne
	@JsonIgnore
	@IndexingDependency(reindexOnUpdate = ReindexOnUpdate.SHALLOW)
	private Job job;

	@Override
	public PostStatus getStatus() {
		return this.getJob().getStatus();
	}

	@Override
	public Job getInfo() {
		return this.getJob();
	}

}
