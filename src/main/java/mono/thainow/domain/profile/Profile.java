package mono.thainow.domain.profile;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.search.mapper.pojo.mapping.definition.annotation.GenericField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.review.ProfileReview;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.user.User;
import mono.thainow.view.View;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "PROFILE_TYPE", discriminatorType = DiscriminatorType.STRING)
@JsonView(View.Basic.class)
@Indexed
public abstract class Profile implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

//	Basic Information

	@Id
	@GeneratedValue
	@GenericField(name = "id")
	@GenericField(name = "postOwnerId")
	@GenericField(name = "profileRevieweeId")
	@GenericField(name = "reviewerId")
	@GenericField(name = "blockerId")
	private Long id;

	@JsonProperty("type")
	public ProfileType getType() {
		return ProfileType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
	}

	public abstract Object getInfo();

//	Request ONLY

	@ManyToOne
	@JsonIgnore
//	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
//	@JsonIdentityReference(alwaysAsId = true)
	private User account;

	@JsonIgnore
	@OneToMany(mappedBy = "reviewer", fetch = FetchType.LAZY)
	@IndexedEmbedded(includePaths = { "reviewByProfileId" })
	private List<Review> reviewedList;

	@JsonIgnore
	@OneToMany(mappedBy = "profile", fetch = FetchType.LAZY)
	@IndexedEmbedded(includePaths = { "reviewOfProfileId" })
	private List<ProfileReview> reviews;
 
	@JsonIgnore
	@OneToMany(mappedBy = "owner", fetch = FetchType.LAZY)
	@IndexedEmbedded(includePaths = { "postId" })
	private List<Post> posts;

	@JsonIgnore
	@ManyToMany(mappedBy = "blockers", fetch = FetchType.LAZY)
	@IndexedEmbedded(includePaths = { "blockedPostId" })
	private List<Post> blockedPosts;

	public int getTotalReview() {
		try {
			return reviews.size();
		} catch (Exception e) {
			return 0;
		}
	}

	public Double getAvgRating() {
		try {

			BigDecimal avgRating = new BigDecimal(
					this.reviews.stream().reduce(0, (total, e) -> total + e.getRate(), Integer::sum)
							/ (double) reviews.size()).setScale(1, RoundingMode.HALF_UP);

			return avgRating.doubleValue();
		} catch (Exception e) {
			return 0.0;
		}
	}
}
