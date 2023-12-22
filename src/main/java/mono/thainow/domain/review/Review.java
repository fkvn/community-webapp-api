package mono.thainow.domain.review;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.domain.profile.Profile;
import mono.thainow.view.View;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.envers.RelationTargetAuditMode;
import org.hibernate.search.engine.backend.types.Aggregable;
import org.hibernate.search.engine.backend.types.Sortable;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.GenericField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.KeywordField;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@RequiredArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "REVIEW_TYPE", discriminatorType = DiscriminatorType.STRING)
@JsonView(View.Basic.class)
@Indexed
@Audited(withModifiedFlag = true)
public class Review implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    @GenericField(name = "id")
    @GenericField(name = "postId")
    @GenericField(name = "reviewByProfileId")
    @GenericField(name = "reviewOfProfileId")
    @GenericField(name = "reviewOfPostId")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "REVIEWER_ID")
    @Audited(targetAuditMode = RelationTargetAuditMode.NOT_AUDITED)
    @IndexedEmbedded(includePaths = {"reviewerId"})
    private Profile reviewer;

    @UpdateTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "REVIEW_UPDATED_ON")
    @GenericField(sortable = Sortable.YES)
    private LocalDateTime updatedOn;

    @Column(name = "REVIEW_COMMENT")
    private String comment;

    @Column(name = "REVIEW_RATE")
    @GenericField(sortable = Sortable.YES, aggregable = Aggregable.YES)
    private int rate = 0;

    @Column(name = "REVIEW_HELPFUL_COUNT")
    private int helpfulCount = 0;

    @Enumerated(EnumType.STRING)
    @Column(name = "REVIEW_STATUS")
    @KeywordField
    @JsonIgnore
    private ReviewStatus status = ReviewStatus.DISABLED;
    //	Full Detail Information
    @CreationTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @JsonView(View.FullDetail.class)
    @Column(name = "REVIEW_CREATED_ON")
    private LocalDateTime createdOn;

    @JsonProperty("type")
    public ReviewType getDecriminatorValue() {
        return ReviewType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
    }

}
