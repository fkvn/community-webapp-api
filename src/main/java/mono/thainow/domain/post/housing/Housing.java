//package mono.thainow.domain.post.housing;
//
//import com.fasterxml.jackson.annotation.JsonFormat;
//import com.fasterxml.jackson.annotation.JsonIgnore;
//import com.fasterxml.jackson.annotation.JsonView;
//import lombok.Getter;
//import lombok.RequiredArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;
//import mono.thainow.domain.location.Location;
//import mono.thainow.domain.post.PostStatus;
//import mono.thainow.domain.storage.Storage;
//import mono.thainow.search.HousingInteriorSummary;
//import mono.thainow.view.View;
//import org.hibernate.annotations.CreationTimestamp;
//import org.hibernate.annotations.UpdateTimestamp;
//import org.hibernate.envers.Audited;
//import org.hibernate.search.engine.backend.types.Sortable;
//import org.hibernate.search.mapper.pojo.automaticindexing.ReindexOnUpdate;
//import org.hibernate.search.mapper.pojo.bridge.builtin.annotation.GeoPointBinding;
//import org.hibernate.search.mapper.pojo.bridge.mapping.annotation.PropertyBinderRef;
//import org.hibernate.search.mapper.pojo.mapping.definition.annotation.*;
//
//import javax.persistence.*;
//import java.io.Serializable;
//import java.time.LocalDateTime;
//import java.util.*;
//
//@Getter
//@Setter
//@ToString
//@RequiredArgsConstructor
//@Entity
//@JsonView(View.Basic.class)
//@Audited(withModifiedFlag = true)
//@Indexed
//public class Housing implements Serializable {
//
//    /**
//     *
//     */
//    private static final long serialVersionUID = 1L;
//
////	Basic Information
//
//    @Id
//    @GeneratedValue
//    @JsonIgnore
//    private Long id;
//
//    @Column(name = "HOUSING_TITLE")
//    @FullTextField
//    private String title;
//
//    @UpdateTimestamp
//    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
//    @Column(name = "HOUSING_UPDATED_ON")
//    @GenericField(sortable = Sortable.YES)
//    private LocalDateTime updatedOn;
//
//    @Enumerated(EnumType.STRING)
//    @Column(name = "HOUSING_STATUS")
//    @KeywordField
//    private PostStatus status = PostStatus.DISABLED;
//
//    @ManyToOne
//    @JoinColumn(name = "HOUSING_LOCATION_ID")
//    @GeoPointBinding(sortable = Sortable.YES)
//    @IndexingDependency(reindexOnUpdate = ReindexOnUpdate.SHALLOW)
//    private Location location;
//
//    @OneToMany
//    private List<Storage> pictures = new ArrayList<>();
//
//    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
//    @Column(name = "HOUSING_EXPIRED_ON")
//    @GenericField
//    private LocalDateTime expiredOn;
//
////	Detail Information
//
//    @ElementCollection
//    @MapKeyColumn(name = "CONTACT_FIELD")
//    @Column(name = "CONTACT_VALUE")
//    @CollectionTable(name = "HOUSING_CONTACT_INFO", joinColumns = @JoinColumn(name =
//    "HOUSING_ID"))
//    @JsonView(View.Detail.class)
//    private Map<String, String> contactInfo = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
//
//    @Column(name = "HOUSING_TYPE")
//    @JsonView(View.Detail.class)
//    @KeywordField
//    @FullTextField(name = "type_search")
//    private String type;
//
//    @Column(name = "HOUSING_DAILY_COST")
//    @JsonView(View.Detail.class)
//    @GenericField
//    private Double dailyCost;
//
//    @Column(name = "HOUSING_MONTHLY_COST")
//    @JsonView(View.Detail.class)
//    @GenericField
//    private Double monthlyCost;
//
//    @Column(name = "HOUSING_ANNUAL_COST")
//    @JsonView(View.Detail.class)
//    @GenericField
//    private Double annualCost;
//
//    @Column(name = "HOUSING_DEPOSIT_COST")
//    @JsonView(View.Detail.class)
//    @GenericField
//    private Double depositCost;
//
//    @Column(name = "HOUSING_CATEGORY")
//    @JsonView(View.Detail.class)
//    @KeywordField
//    @FullTextField(name = "category_search")
//    private String category;
//
//    @JsonView(View.Detail.class)
//    @ElementCollection
//    @FullTextField
//    @GenericField(name = "amenities-filter")
//    private Set<String> amenities = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
//
//    @ElementCollection
//    @MapKeyColumn(name = "INTERIOR_FIELD")
//    @Column(name = "INTERIOR_VALUE")
//    @CollectionTable(name = "HOUSING_INTERIOR", joinColumns = @JoinColumn(name = "HOUSING_ID"))
//    @JsonView(View.Detail.class)
//    @PropertyBinding(binder = @PropertyBinderRef(type = HousingInteriorSummary.class))
////	@GenericField(extraction = @ContainerExtraction(BuiltinContainerExtractors.MAP_KEY))
//    private Map<String, Integer> interior = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
//
//    @Lob
//    @Column(name = "HOUSING_DESCRIPTION")
//    @JsonView(View.Detail.class)
//    @FullTextField
//    private String description;
//
//    //	Full Detail Information
//    @CreationTimestamp
//    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
//    @JsonView(View.FullDetail.class)
//    @Column(name = "HOUSING_CREATED_ON")
//    private LocalDateTime createdOn;
//
////	Request Only
//
//    @OneToOne(mappedBy = "housing", fetch = FetchType.LAZY)
//    @JsonIgnore
//    private HousingPost post;
//
//}
