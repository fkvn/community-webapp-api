package mono.thainow.domain.post.job;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
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
import java.util.*;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
@Indexed
public class Job implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

//	Basic Information

    @Id
    @GeneratedValue
    @JsonIgnore
    private Long id;

    @FullTextField
    @Column(name = "JOB_TITLE")
    private String title;

    @UpdateTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "JOB_UPDATED_ON")
    @GenericField(sortable = Sortable.YES)
    private LocalDateTime updatedOn;

    @Enumerated(EnumType.STRING)
    @Column(name = "JOB_STATUS")
    @KeywordField
    private PostStatus status = PostStatus.DISABLED;

    @ManyToOne
    @JoinColumn(name = "JOB_LOCATION_ID")
    @GeoPointBinding(sortable = Sortable.YES)
    @IndexingDependency(reindexOnUpdate = ReindexOnUpdate.SHALLOW)
    private Location location;

    @OneToMany
    private List<Storage> pictures = new ArrayList<>();

    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "JOB_EXPIRED_ON")
    @GenericField
    private LocalDateTime expiredOn;

//	Detail Information

    @ElementCollection
    @MapKeyColumn(name = "CONTACT_FIELD")
    @Column(name = "CONTACT_VALUE")
    @CollectionTable(name = "JOB_CONTACT_INFO", joinColumns = @JoinColumn(name = "JOB_ID"))
    @JsonView(View.Detail.class)
    private Map<String, String> contactInfo = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);

    @Column(name = "IS_JOB_REMOTE")
    @JsonView(View.Detail.class)
    @JsonProperty("isRemote")
    @GenericField
    private boolean remote = false;

    @JsonView(View.Detail.class)
    @ElementCollection
    @FullTextField
    @GenericField(name = "position-filter")
    private Set<String> positions = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);

    @Column(name = "JOB_EXPERIENCE")
    @JsonView(View.Detail.class)
    @KeywordField
    private String experience;

    @Column(name = "JOB_SALARY")
    @JsonView(View.Detail.class)
    @FullTextField
    private String salary;

    @Column(name = "JOB_SKILLS")
    @JsonView(View.Detail.class)
    @FullTextField
    private String skills;

    @Lob
    @Column(name = "JOB_DESCRIPTION")
    @JsonView(View.Detail.class)
    @FullTextField
    private String description;

    //	Full Detail Information
    @CreationTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @JsonView(View.FullDetail.class)
    @Column(name = "JOB_CREATED_ON")
    private LocalDateTime createdOn;

//	Request Only

    @OneToOne(mappedBy = "job", fetch = FetchType.LAZY)
    @JsonIgnore
    private JobPost post;
}
