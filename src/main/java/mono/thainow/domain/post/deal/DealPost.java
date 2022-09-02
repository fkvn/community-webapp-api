package mono.thainow.domain.post.deal;

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
	public PostStatus getStatus() {
		return this.getDeal().getStatus();
	}

	@Override
	public Deal getInfo() {
		return this.getDeal();
	}

}
