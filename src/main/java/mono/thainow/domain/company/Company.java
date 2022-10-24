package mono.thainow.domain.company;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

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
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.profile.BusinessProfile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.view.View;

@Entity
@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Table
@Indexed
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
public class Company implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

//	Basic Information

	@Id
	@GeneratedValue
	@JsonIgnore
	private Long id;

	@NotEmpty
	@Column(name = "COMPANY_NAME")
	@FullTextField
	private String name;

	@NotEmpty
	@Column(name = "COMPANY_INDUSTRY")
	@FullTextField
	private String industry;

	@OneToOne
	@JsonProperty("picture")
	private Storage logo;


	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	@GeoPointBinding(sortable = Sortable.YES)
	@IndexingDependency(reindexOnUpdate = ReindexOnUpdate.SHALLOW)
	private Location location;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "COMPANY_STATUS")
	@KeywordField
	private CompanyStatus status = CompanyStatus.UNREGISTERED;
	
	@OneToMany
	private List<Storage> pictures = new ArrayList<>();

	@UpdateTimestamp
	@Column(name = "COMPANY_UPDATED_ON")
	@JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
	@GenericField(sortable = Sortable.YES)
	private Date updatedOn = new Date();

//	Public Detail Information
	
	@Lob
	@Column(name = "COMPANY_DESCRIPTION")
	@JsonView(View.Detail.class)
	@FullTextField
	private String description;

	@Column(name = "COMPANY_EMAIL")
	@JsonView(View.Detail.class)
	private String email;

	@Column(name = "COMPANY_PHONE")
	@JsonView(View.Detail.class)
	private String phone;

	@Column(name = "COMPANY_WEBSITE")
//	@URL(regexp = "(?i)^(?:http://|https://).*", message = "Company website must be a valid URL")
	@JsonView(View.Detail.class)
	private String website;

	@Column(name = "COMPANY_FOUNDED")
	@JsonView(View.Detail.class)
	private String founded;

	@Column(name = "COMPANY_REVENUE")
	@JsonView(View.Detail.class)
	private String revenue;

	@Column(name = "COMPANY_SIZE")
	@JsonView(View.Detail.class)
	private String size;

//	Private Detail Information

	@Column(name = "IS_COMPANY_DESCRIPTION_PUBLIC")
	@JsonProperty("isDescriptionPublic")
	@JsonView(View.Detail.class)
	private boolean descriptionPublic = true;

	@Column(name = "IS_COMPANY_EMAIL_PUBLIC")
	@JsonProperty("isEmailPublic")
	@JsonView(View.Detail.class)
	private boolean emailPublic = true;

	@Column(name = "IS_COMPANY_PHONE_PUBLIC")
	@JsonProperty("isPhonePublic")
	@JsonView(View.Detail.class)
	private boolean phonePublic = true;

	@Column(name = "IS_COMPANY_WEBSITE_PUBLIC")
	@JsonProperty("isWebsitePublic")
	@JsonView(View.Detail.class)
	private boolean websitePublic = true;

	@Column(name = "IS_COMPANY_SIZE_PUBLIC")
	@JsonProperty("isSizePublic")
	@JsonView(View.Detail.class)
	private boolean sizePublic = true;

//	Full Detail Information

	@CreationTimestamp
	@Column(name = "COMPANY_CREATED_ON")
	@JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
	@JsonView(View.FullDetail.class)
	private Date createdOn = new Date();

	@Column(name = "IS_COMPANY_INFORMAL")
	@JsonView(View.FullDetail.class)
	private boolean informalCompany = false;

	@Column(name = "IS_COMPANY_EMAIL_VERIFIED")
	@JsonView(View.FullDetail.class)
	private boolean emailVerified = false;

	@Column(name = "IS_COMPANY_PHONE_VERIFIED")
	@JsonView(View.FullDetail.class)
	private boolean phoneVerified = false;
	
//	Request Only
	
	@OneToOne(mappedBy = "company", fetch = FetchType.LAZY)
	@JsonIgnore
	private BusinessProfile profile;

//	
//	@Latitude
//	@Column(name = "COMPANY_LAT")
//	@JsonView(View.FullDetail.class)
//	private Double lat;
//
//	@Longitude
//	@Column(name = "COMPANY_LNG")
//	@JsonView(View.FullDetail.class)
//	private Double lng;
//
//	@PrePersist
//	private void updateLocation() {
//		this.lat = Optional.ofNullable(this.getLocation().getLat()).orElse(null);
//		this.lng = Optional.ofNullable(this.getLocation().getLng()).orElse(null);
//	}

}
