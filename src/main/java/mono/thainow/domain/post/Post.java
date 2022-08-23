package mono.thainow.domain.post;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.view.View;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "POST_TYPE", discriminatorType = DiscriminatorType.STRING)
@JsonView(View.Basic.class)
public abstract class Post implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne
	@JsonIgnore
	private Profile owner;

	@Transient
	public Map<String, Object> getPostOwner() {
		Map<String, Object> basicOwnerInfo = new HashMap<>();

		basicOwnerInfo.put("id", this.getOwner().getId());
		basicOwnerInfo.put("username", this.getOwner().getUsername());
		basicOwnerInfo.put("status", this.getOwner().getStatus());
		basicOwnerInfo.put("picture", this.getOwner().getPicture());
		basicOwnerInfo.put("type", this.getOwner().getDecriminatorValue());

		return basicOwnerInfo;
	};

	@Transient
	@JsonProperty("type")
	public String getType() {
		return this.getClass().getAnnotation(DiscriminatorValue.class).value();
	}

	public abstract String getTitle();

	public abstract Location getLocation();

	public abstract List<Storage> getPictures();

	public abstract Map<String, String> getContactInfo();

	public abstract Date getLastUpdatedOn();

	@JsonView(View.Detail.class)
	public abstract PostStatus getStatus();

	@JsonView(View.Detail.class)
	public abstract Object getDetailInfo();

}
