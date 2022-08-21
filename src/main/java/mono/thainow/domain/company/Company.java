package mono.thainow.domain.company;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Index;
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
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.storage.Storage;
import mono.thainow.view.View;

@Entity
@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Table(indexes = { @Index(name = "company_name_UNIQUE", columnList = "COMPANY_NAME", unique = false) })
@Indexed
@JsonView(View.Basic.class)
public class Company implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

//	Basic Information

	@Id
	@GeneratedValue
	private Long id;

	@NotEmpty
	@Column(name = "COMPANY_NAME")
	@FullTextField
	private String name;

	@NotEmpty
	@Column(name = "COMPANY_INDUSTRY")
	private String industry;

	@OneToOne
	private Storage logo;

	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	private Location location;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "COMPANY_STATUS")
	private CompanyStatus status = CompanyStatus.UNREGISTERED;

	@UpdateTimestamp
	@Column(name = "COMPANY_UPDATED_ON")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date updatedOn = new Date();

	@OneToMany
	private List<Storage> coverPictures = new ArrayList<>();
	
//	Public Detail Information
	
	@Lob
	@Column(name = "COMPANY_DESCRIPTION")
	@JsonView(View.Detail.class)
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
	@JsonView(View.Detail.class)
	private boolean descriptionPublic = true;
	
	@Column(name = "IS_COMPANY_EMAIL_PUBLIC")
	@JsonView(View.Detail.class)
	private boolean emailPublic = true;

	@Column(name = "IS_COMPANY_PHONE_PUBLIC")
	@JsonView(View.Detail.class)
	private boolean phonePublic = true;

	@Column(name = "IS_COMPANY_WEBSITE_PUBLIC")
	@JsonView(View.Detail.class)
	private boolean websitePublic = true;
	
	@Column(name = "IS_COMPANY_SIZE_PUBLIC")
	@JsonView(View.Detail.class)
	private boolean sizePublic = true;
	
//	Full Detail Information
	
	@CreationTimestamp
	@Column(name = "COMPANY_CREATED_ON")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
	
}
