package mono.thainow.domain.post.deal;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.storage.Storage;
import mono.thainow.view.View;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.search.engine.backend.types.Sortable;
import org.hibernate.search.mapper.pojo.automaticindexing.ReindexOnUpdate;
import org.hibernate.search.mapper.pojo.bridge.builtin.annotation.GeoPointBinding;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.*;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
@Indexed
public class Deal implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

//	Basic Information

    @Id
    @GeneratedValue
    @JsonIgnore
    private Long id;

    @Column(name = "DEAL_TITLE")
    @FullTextField
    private String title;

    @UpdateTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "DEAL_UPDATED_ON")
    @GenericField(sortable = Sortable.YES)
    private LocalDateTime updatedOn;

    @Enumerated(EnumType.STRING)
    @Column(name = "DEAL_STATUS")
    @KeywordField
    private PostStatus status = PostStatus.DISABLED;

    @ManyToOne
    @JoinColumn(name = "DEAL_LOCATION_ID")
    @GeoPointBinding(sortable = Sortable.YES)
    @IndexingDependency(reindexOnUpdate = ReindexOnUpdate.SHALLOW)
    private Location location;

    @OneToMany
    private List<Storage> pictures = new ArrayList<>();

    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "DEAL_EXPIRED_ON")
    @GenericField
    private LocalDateTime expiredOn;

//	Detail Information

    @ElementCollection
    @MapKeyColumn(name = "CONTACT_FIELD")
    @Column(name = "CONTACT_VALUE")
    @CollectionTable(name = "DEAL_CONTACT_INFO", joinColumns = @JoinColumn(name = "DEAL_ID"))
    @JsonView(View.Detail.class)
    private Map<String, String> contactInfo = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);

    @Column(name = "DEAL_CATEGORY")
    @JsonView(View.Detail.class)
    @FullTextField(name = "category_search")
    private String category;

    @Lob
    @Column(name = "DEAL_DESCRIPTION")
    @JsonView(View.Detail.class)
    @FullTextField
    private String description;

    //	Full Detail Information
    @CreationTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @JsonView(View.FullDetail.class)
    @Column(name = "DEAL_CREATED_ON")
    private LocalDateTime createdOn;

//	Request Only

    @OneToOne(mappedBy = "deal", fetch = FetchType.LAZY)
    @JsonIgnore
    private DealPost post;

}
