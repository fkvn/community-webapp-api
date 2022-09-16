package mono.thainow.domain.review;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.Profile;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("POST_REVIEW")
public class PostReview extends Review {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public PostReview(Profile reviewer, Post reviewee) {
		this.setReviewer(reviewer);
		this.setPost(reviewee);
	}

//	Basic Information

	@ManyToOne
	@JoinColumn(name = "REVIEWEE_ID")
	@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
	@IndexedEmbedded( includePaths = { "id" })
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
	@JsonIdentityReference(alwaysAsId = true)
	@JsonProperty("postId")
	private Post post;

}
