package mono.thainow.domain.post;

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

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.search.mapper.pojo.automaticindexing.ReindexOnUpdate;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.GenericField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexingDependency;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.PostReview;
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
@Indexed
public abstract class Post implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@GenericField
	private Long id;

	@ManyToOne
	@JsonIgnore
	@IndexedEmbedded( includePaths = { "id" })
	private Profile owner;

	public Profile getPostOwner() {
		return this.getOwner();
	};

	@JsonProperty("type")
	public PostType getType() {
		return PostType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
	}

	@JsonIgnore
	public abstract PostStatus getStatus();

	@JsonIgnore
	@OneToMany(mappedBy = "post", fetch = FetchType.LAZY)
	@IndexedEmbedded
	public Set<PostReview> reviews;

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

//	public Long totalReview = (long) 0;
//	
//	public Double avgRate = (double) 0;

	public abstract Object getInfo();

}
