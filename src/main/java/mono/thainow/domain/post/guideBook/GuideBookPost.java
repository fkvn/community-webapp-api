package mono.thainow.domain.post.guideBook;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.post.Post;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("GUIDEBOOK_POST")
public class GuideBookPost extends Post {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    @OneToOne
    @JsonIgnore
    @IndexedEmbedded
    private GuideBook guideBook;

    public GuideBookPost(GuideBook guideBook) {
        this.setGuideBook(guideBook);
    }

    @Override
    public GuideBook getDetails() {
        return this.getGuideBook();
    }

}
