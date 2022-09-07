package mono.thainow.domain.review;

import java.io.Serializable;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.domain.profile.Profile;
import mono.thainow.view.View;

@Getter
@Setter
@RequiredArgsConstructor
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "REVIEW_TYPE", discriminatorType = DiscriminatorType.STRING)
public abstract class Review<T> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@ManyToOne
	@JoinColumn(name = "REVIEWER_ID")
	@IndexedEmbedded
	@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
	private Profile reviewer;

	@ManyToOne
	@JoinColumn(name = "REVIEWEE_POST_ID")
	@IndexedEmbedded
	@Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
	private T reviewee;

	@JsonProperty("type")
	public ReviewType getDecriminatorValue() {
		return ReviewType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
	}
}
