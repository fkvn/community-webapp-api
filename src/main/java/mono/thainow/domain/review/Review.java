package mono.thainow.domain.review;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.search.mapper.pojo.automaticindexing.ReindexOnUpdate;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexingDependency;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.profile.Profile;
import mono.thainow.view.View;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "REVIEW_TYPE", discriminatorType = DiscriminatorType.STRING)
@JsonView(View.Basic.class)
@Indexed
public class Review implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne
	@JoinColumn(name = "REVIEWER_ID")
	@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
	@IndexingDependency(reindexOnUpdate = ReindexOnUpdate.SHALLOW)
	private Profile reviewer;

	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "REVIEW_UPDATED_ON")
	private Date updatedOn = new Date();

	@Column(name = "REVIEW_COMMENT")
	private String comment;

	@Column(name = "REVIEW_RATE")
	private int rate = 0;

	@Column(name = "REVIEW_HELPFUL_COUNT")
	private int helpfulCount = 0;

	@Enumerated(EnumType.STRING)
	@Column(name = "REVIEW_STATUS")
	private ReviewStatus status = ReviewStatus.DISABLED;

	@JsonProperty("type")
	public ReviewType getDecriminatorValue() {
		return ReviewType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
	}

//	Full Detail Information
	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonView(View.FullDetail.class)
	@Column(name = "REVIEW_CREATED_ON")
	private Date createdOn = new Date();

}
