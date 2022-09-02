package mono.thainow.domain.post.housing;

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
	public PostStatus getStatus() {
		return this.getHousing().getStatus();
	}

	@Override
	public Housing getInfo() {
		return this.getHousing();
	}



}
