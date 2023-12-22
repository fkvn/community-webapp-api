package mono.thainow.domain.post;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.domain.notification.NotificationVia;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.PostReview;
import mono.thainow.view.View;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.GenericField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.KeywordField;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.util.List;

@RequiredArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "POST_TYPE", discriminatorType = DiscriminatorType.STRING)
@JsonView(View.Basic.class)
@Indexed
@Audited(withModifiedFlag = true)
public abstract class Post implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    @GenericField
    @GenericField(name = "postId")
    @GenericField(name = "postReviewedId")
    @GenericField(name = "blockedPostId")
    private Long id;

    @ManyToOne
    @IndexedEmbedded(includePaths = {"postOwnerId"})
    private Profile owner;

    @JsonIgnore
    @ManyToMany(fetch = FetchType.LAZY)
    @IndexedEmbedded(includePaths = {"blockerId"})
    private List<Profile> blockers;

    @Column(name = "IS_RECEIVE_NOTIFICATION")
    private boolean isReceiveNotification = false;

    @Column(name = "POST_NOTIFICATION_VIA")
    @Enumerated(EnumType.STRING)
    private NotificationVia notificationVia;

    @Column(name = "IS_POST_AS_ANONYMOUS")
    private boolean isPostAsAnonymous = false;

    @Enumerated(EnumType.STRING)
    @Column(name = "POST_STATUS")
    @KeywordField
    private PostStatus status = PostStatus.DISABLED;

    @CreationTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "POST_CREATED_ON")
    private LocalDateTime createdOn;

    @UpdateTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "POST_UPDATED_ON")
    private LocalDateTime updatedOn;

    @JsonIgnore
    @OneToMany(mappedBy = "post", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
    @IndexedEmbedded(includePaths = {"reviewOfPostId"})
    private List<PostReview> reviews;

    @JsonProperty("type")
    public PostType getType() {
        return PostType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
    }

    public long getTotalReviewer() {
        return reviews.size();
    }

    // comments including replies, etc.
    public long getTotalComments() {
        return reviews.size();
    }

    public Double getAvgReviewRating() {
        try {
            BigDecimal avgRating = BigDecimal.valueOf(this.reviews.stream()
                    .reduce(0, (total, e) -> total + e.getRate(), Integer::sum) /
                    (double) reviews.size()).setScale(1, RoundingMode.HALF_UP);

            return avgRating.doubleValue();
        } catch (Exception e) {
            return 0.0;
        }
    }

    //
    public abstract Object getDetails();


}
