package mono.thainow.domain.review;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.profile.Profile;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("PROFILE_REVIEW")
public class ProfileReview extends Review {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ProfileReview(Profile reviewer, Profile reviewee) {
		this.setReviewer(reviewer);
		this.setProfile(reviewee);
	}


//	Basic Information 

	@ManyToOne
	@JoinColumn(name = "REVIEWEE_PROFILE_ID")
	@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
	private Profile profile;

}
