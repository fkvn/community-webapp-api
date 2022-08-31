package mono.thainow.domain.post.marketplace;

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
@DiscriminatorValue("MARKETPLACE_POST")
public class MarketplacePost extends Post {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public MarketplacePost(Profile owner, Marketplace marketplace) {
		this.setOwner(owner);
		this.setMarketplace(marketplace);
	}

	@OneToOne
	@JsonIgnore
	private Marketplace marketplace;

	@Override
	public String getTitle() {
		return this.getMarketplace().getTitle();
	}

	@Override
	public Location getLocation() {
		return this.getMarketplace().getLocation();
	}

	@Override
	public List<Storage> getPictures() {
		return this.getMarketplace().getPictures();
	}

	@Override
	public Map<String, String> getContactInfo() {
		return this.getMarketplace().getContactInfo();
	}

	@Override
	public PostStatus getStatus() {
		return this.getMarketplace().getStatus();
	}

	@Override
	public Object getDetailInfo() {
		return this.getMarketplace();
	}

	@Override
	public Date getUpdatedOn() {
		return this.getMarketplace().getUpdatedOn();
	}

}
