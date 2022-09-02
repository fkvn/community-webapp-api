package mono.thainow.domain.post.marketplace;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

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
	public PostStatus getStatus() {
		return this.getMarketplace().getStatus();
	}

	@Override
	public Marketplace getInfo() {
		return this.getMarketplace();
	}

}
