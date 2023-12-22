package mono.thainow.domain.review;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.domain.profile.Profile;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("PROFILE_REVIEW")
@Audited(withModifiedFlag = true)
public class ProfileReview extends Review {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    @ManyToOne
    @JoinColumn(name = "REVIEWED_PROFILE_ID")
    @Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
    @IndexedEmbedded(includePaths = {"profileReviewedId"})
    @JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
    @JsonIdentityReference(alwaysAsId = true)
    @JsonProperty("profileId")
    private Profile profile;

    //	Basic Information

    public ProfileReview(Profile reviewer, Profile reviewee) {
        this.setReviewer(reviewer);
        this.setProfile(reviewee);
    }

}
