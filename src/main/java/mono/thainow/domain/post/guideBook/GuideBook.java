package mono.thainow.domain.post.guideBook;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.view.View;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.search.engine.backend.types.Sortable;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.GenericField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
@Indexed
public class GuideBook implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    //	Basic Information

    @Id
    @GeneratedValue
    @JsonIgnore
    private Long id;

    @Column(name = "GUIDEBOOK_TITLE")
    @FullTextField
    private String title;

    @Lob
    @Column(name = "GUIDEBOOK_DESCRIPTION", columnDefinition = "LONGTEXT")
    @JsonView(View.Detail.class)
    @FullTextField
    private String description;

    @UpdateTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "GUIDEBOOK_UPDATED_ON")
    @GenericField(sortable = Sortable.YES)
    private LocalDateTime updatedOn;

    @Column(name = "GUIDEBOOK_CATEGORY")
    @Enumerated(EnumType.STRING)
    private GuideBookCategory category;

    //	Detail Information

    @Lob
    @Column(name = "GUIDEBOOK_CONTENT", columnDefinition = "LONGTEXT")
    @JsonView(View.Detail.class)
    @FullTextField
    private String content;

    //	Full Detail Information
    @CreationTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @JsonView(View.FullDetail.class)
    @Column(name = "DEAL_CREATED_ON")
    private LocalDateTime createdOn;

    //	Request Only
    @OneToOne(mappedBy = "guideBook", fetch = FetchType.LAZY)
    @JsonIgnore
    private GuideBookPost guideBookPost;

}
