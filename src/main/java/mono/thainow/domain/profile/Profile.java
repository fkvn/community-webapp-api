package mono.thainow.domain.profile;

import com.fasterxml.jackson.annotation.*;
import lombok.*;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.review.ProfileReview;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.user.User;
import mono.thainow.view.View;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.GenericField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "PROFILE_TYPE", discriminatorType = DiscriminatorType.STRING)
@JsonView(View.Basic.class)
@Indexed
public abstract class Profile implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

//	Basic Information

    @Id
    @GeneratedValue
    @GenericField(name = "id")
    @GenericField(name = "postOwnerId")
    @GenericField(name = "profileRevieweeId")
    @GenericField(name = "reviewerId")
    @GenericField(name = "blockerId")
    @JsonProperty("profileId")
    private Long id;

    @ManyToOne
    @JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
    @JsonIdentityReference(alwaysAsId = true)
    @JsonProperty("accountId")
    private User account;
    //	Request ONLY
    @JsonIgnore
    @OneToMany(mappedBy = "reviewer", fetch = FetchType.LAZY)
    @IndexedEmbedded(includePaths = {"reviewByProfileId"})
    private List<Review> reviewedList;
    @JsonIgnore
    @OneToMany(mappedBy = "profile", fetch = FetchType.LAZY)
    @IndexedEmbedded(includePaths = {"reviewOfProfileId"})
    private List<ProfileReview> reviews;
    @JsonIgnore
    @OneToMany(mappedBy = "owner", fetch = FetchType.LAZY)
    @IndexedEmbedded(includePaths = {"postId"})
    private List<Post> posts;
    @JsonIgnore
    @ManyToMany(mappedBy = "blockers", fetch = FetchType.LAZY)
    @IndexedEmbedded(includePaths = {"blockedPostId"})
    private List<Post> blockedPosts;

    public abstract Object getDetails();

    @JsonProperty("type")
    public ProfileType getType() {
        return ProfileType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
    }

    public int getTotalReview() {
        try {
            return reviews.size();
        } catch (Exception e) {
            return 0;
        }
    }

    public Double getAvgRating() {
        try {

            BigDecimal avgRating = BigDecimal.valueOf(this.reviews.stream().reduce(0, (total, e) -> total + e.getRate(), Integer::sum)
                    / (double) reviews.size()).setScale(1, RoundingMode.HALF_UP);

            return avgRating.doubleValue();
        } catch (Exception e) {
            return 0.0;
        }
    }
}
