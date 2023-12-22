package mono.thainow.domain.post.guideBook;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.profile.Profile;
import mono.thainow.view.View;
import org.hibernate.envers.Audited;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("GUIDEBOOK_POST")
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
public class GuideBookPost extends Post {

    /**
     *
     */

    @OneToOne(cascade = CascadeType.REMOVE)
    @JsonIgnore
    @IndexedEmbedded
    private GuideBook guideBook;

    public GuideBookPost(GuideBook guideBook) {
        this.setGuideBook(guideBook);
        this.setStatus(PostStatus.PUBLIC);
    }

    public GuideBookPost(Profile owner, GuideBook guideBook) {
        this.setOwner(owner);
        this.setGuideBook(guideBook);
        this.setStatus(PostStatus.PUBLIC);
    }

    @Override
    public GuideBook getDetails() {
        return this.getGuideBook();
    }

}
