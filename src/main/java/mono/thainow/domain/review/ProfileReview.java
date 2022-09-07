package mono.thainow.domain.review;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.profile.Profile;

@Getter
@Setter
@Entity
@DiscriminatorValue("PROFILE_REVIEW")
public class ProfileReview extends Review<Profile> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//	Basic Information

	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne
	@JoinColumn(name = "REVIEWER_ID")
	@IndexedEmbedded
	@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
	private Profile reviewer;

	@ManyToOne
	@JoinColumn(name = "REVIEWEE_POST_ID")
	@IndexedEmbedded
	@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
	private Profile reviewee;

	private String comment;

	private int rate;

	private int helpfulCount;

}
