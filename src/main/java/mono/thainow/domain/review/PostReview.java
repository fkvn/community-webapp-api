package mono.thainow.domain.review;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.post.Post;

@Getter
@Setter
@Entity
@DiscriminatorValue("POST_REVIEW")
public class PostReview extends Review {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@ManyToOne
	@JoinColumn(name = "REVIEWEE_POST_ID")
	@IndexedEmbedded
	@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
	private Post reviewee;

}
