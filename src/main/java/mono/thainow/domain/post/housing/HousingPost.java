package mono.thainow.domain.post.housing;

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
@DiscriminatorValue("HOUSING_POST")
public class HousingPost extends Post {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public HousingPost(Profile owner, Housing housing) {
		this.setOwner(owner);
		this.setHousing(housing);
	}

	@OneToOne
	@JsonIgnore
	private Housing housing;

	@Override
	public String getTitle() {
		return this.getHousing().getTitle();
	}

	@Override
	public Location getLocation() {
		return this.getHousing().getLocation();
	}

	@Override
	public List<Storage> getPictures() {
		return this.getHousing().getPictures();
	}

	@Override
	public Map<String, String> getContactInfo() {
		return this.getHousing().getContactInfo();
	}

	@Override
	public PostStatus getStatus() {
		return this.getHousing().getStatus();
	}

	@Override
	public Object getDetailInfo() {
		return this.getHousing();
	}

	@Override
	public Date getLastUpdatedOn() {
		return this.getHousing().getUpdatedOn();
	}

}
