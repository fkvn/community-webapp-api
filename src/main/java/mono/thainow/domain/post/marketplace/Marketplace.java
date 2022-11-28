package mono.thainow.domain.post.marketplace;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.search.engine.backend.types.Sortable;
import org.hibernate.search.mapper.pojo.automaticindexing.ReindexOnUpdate;
import org.hibernate.search.mapper.pojo.bridge.builtin.annotation.GeoPointBinding;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.GenericField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexingDependency;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.KeywordField;

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

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@JsonView(View.Basic.class)
@Audited( withModifiedFlag = true )
@Indexed
public class Marketplace implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

//	Basic Information

	@Id
	@GeneratedValue
	@JsonIgnore
	private Long id;

	@Column(name = "MARKETPLACE_TITLE")
	@FullTextField
	private String title;

	@UpdateTimestamp
	@JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
	@Column(name = "MARKETPLACE_UPDATED_ON")
	@GenericField(sortable = Sortable.YES)
	private Date updatedOn = new Date();

	@Enumerated(EnumType.STRING)
	@Column(name = "MARKETPLACE_STATUS")
	@KeywordField
	private PostStatus status = PostStatus.DISABLED;

	@ManyToOne
	@JoinColumn(name = "MARKETPLACE_LOCATION_ID")
	@GeoPointBinding(sortable = Sortable.YES)
	@IndexingDependency(reindexOnUpdate = ReindexOnUpdate.SHALLOW)
	private Location location;

	@OneToMany
	private List<Storage> pictures = new ArrayList<>();

	@JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
	@Column(name = "MARKETPLACE_EXPIRED_ON")
	@GenericField
	private Date expiredOn;

//	Detail Information

	@ElementCollection
	@MapKeyColumn(name = "CONTACT_FIELD")
	@Column(name = "CONTACT_VALUE")
	@CollectionTable(name = "MARKETPLACE_CONTACT_INFO", joinColumns = @JoinColumn(name = "MARKETPLACE_ID"))
	@JsonView(View.Detail.class)
	private Map<String, String> contactInfo = new HashMap<>();

	
	@Column(name = "MARKETPLACE_CONDITION")
	@JsonView(View.Detail.class)
	@KeywordField
	@FullTextField(name = "condition_search")
	private String condition;
	
	@Column(name = "MARKETPLACE_COST")
	@JsonView(View.Detail.class)
	@GenericField
	private Double cost;
	
	@Column(name = "MARKETPLACE_CATEGORY")
	@JsonView(View.Detail.class)
	@KeywordField
	@FullTextField(name = "category_search")
	private String category;
	
	@Lob
	@Column(name = "MARKETPLACE_DESCRIPTION")
	@JsonView(View.Detail.class)
	@FullTextField
	private String description;

//	Full Detail Information
	
	@CreationTimestamp
	@JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
	@JsonView(View.FullDetail.class)
	@Column(name = "MARKETPLACE_CREATED_ON")
	private Date createdOn = new Date();
	
//	Request Only
	
	@OneToOne(mappedBy = "marketplace", fetch = FetchType.LAZY)
	@JsonIgnore
	private MarketplacePost post;

}
