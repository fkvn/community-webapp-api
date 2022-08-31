package mono.thainow.domain.post.job;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.storage.Storage;

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
	private Job job;

	@Override
	public String getTitle() {
		return this.getJob().getTitle();
	}

	@Override
	public Location getLocation() {
		return this.getJob().getLocation();
	}

	@Override
	public List<Storage> getPictures() {
		return this.getJob().getPictures();
	}

	@Override
	public Map<String, String> getContactInfo() {
		return this.getJob().getContactInfo();
	}

	@Override
	public PostStatus getStatus() {
		return this.getJob().getStatus();
	}

	@Override
	public Object getDetailInfo() {
		return this.getJob();
	}

	@Override
	public Date getUpdatedOn() {
		return this.getJob().getUpdatedOn();
	}

}
