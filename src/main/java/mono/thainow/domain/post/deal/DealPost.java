package mono.thainow.domain.post.deal;

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
@DiscriminatorValue("DEAL_POST")
public class DealPost extends Post {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DealPost(Profile owner, Deal deal) {
		this.setOwner(owner);
		this.setDeal(deal);
	}

	@OneToOne
	@JsonIgnore
	private Deal deal;

	@Override
	public String getTitle() {
		return this.getDeal().getTitle();
	}

	@Override
	public Location getLocation() {
		return this.getDeal().getLocation();
	}

	@Override
	public List<Storage> getPictures() {
		return this.getDeal().getPictures();
	}

	@Override
	public Map<String, String> getContactInfo() {
		return this.getDeal().getContactInfo();
	}

	@Override
	public PostStatus getStatus() {
		return this.getDeal().getStatus();
	}

	@Override
	public Object getDetailInfo() {
		return this.getDeal();
	}

	@Override
	public Date getLastUpdatedOn() {
		return this.getDeal().getUpdatedOn();
	}

}
