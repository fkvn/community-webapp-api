package mono.thainow.domain.profile;

import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Set;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
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
import mono.thainow.domain.review.ProfileReview;
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
	@GenericField(name = "revieweeId")
	@GenericField(name = "reviewerId")
	private Long id;

	@JsonProperty("type")
	public String getDecriminatorValue() {
		return this.getClass().getAnnotation(DiscriminatorValue.class).value();
	}

	public abstract Object getInfo();

//	Request ONLY

	@ManyToOne
	@JsonIgnore
//	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
//	@JsonIdentityReference(alwaysAsId = true)
	private User account;

//	@JsonIgnore
//	@OneToMany(mappedBy = "reviewer", fetch = FetchType.LAZY)
//	@IndexedEmbedded(includePaths = { "id" })
//	private Set<Review> reviewedList;

	@JsonIgnore
	@OneToMany(mappedBy = "profile", fetch = FetchType.LAZY)
	@IndexedEmbedded
	private Set<ProfileReview> reviews;

	public int getTotalReview() {
		return reviews.size();
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
