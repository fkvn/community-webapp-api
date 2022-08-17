package mono.thainow.domain.company;

import java.io.Serializable;
import java.util.Date;

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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.validator.constraints.URL;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
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
public class Company implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	// Basic property

	@Id
	@GeneratedValue
	@JsonView(View.Company.Basic.class)
	private Long id;

	@CreationTimestamp
	@Column(name = "COMPANY_CREATED_ON")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonView(View.Company.Basic.class)
	private Date createdOn = new Date();

	@NotEmpty
	@Column(name = "COMPANY_NAME")
	@JsonView(View.Company.Basic.class)
	@FullTextField
	private String name;

	@NotEmpty
	@Column(name = "COMPANY_INDUSTRY")
	@JsonView(View.Company.Basic.class)
	private String industry;
	
	@OneToOne
	@JsonView(View.Company.Basic.class)
	private Storage logo;

	@Column(name = "IS_COMPANY_INFORMAL")
	@JsonView(View.Company.Basic.class)
	private boolean isInformal = false;

	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	@JsonView(View.Company.Basic.class)
	private Location location;

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "COMPANY_STATUS")
	@JsonView(View.Company.Basic.class)
	private CompanyStatus status = CompanyStatus.UNREGISTERED;

	@Column(name = "COMPANY_EMAIL")
	@JsonView(View.Company.Basic.class)
	private String email;

	@Column(name = "COMPANY_PHONE")
	@JsonView(View.Company.Basic.class)
	private String phone;

	@Column(name = "COMPANY_WEBSITE")
	@URL(regexp = "(?i)^(?:http://|https://).*", message = "Company website must be a valid URL")
	@JsonView(View.Company.Basic.class)
	private String website;

	// Detail property

	@UpdateTimestamp
	@Column(name = "COMPANY_UPDATED_ON")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonView(View.Company.Detail.class)
	private Date updatedOn = new Date();
	
	@Lob
	@Column(name = "COMPANY_DESCRIPTION")
	@JsonView(View.Company.Detail.class)
	private String description;

	@Column(name = "COMPANY_FOUNDED")
	@JsonView(View.Company.Detail.class)
	private String founded;

	@Column(name = "COMPANY_REVENUE")
	@JsonView(View.Company.Detail.class)
	private String revenue;

	@Column(name = "COMPANY_SIZE")
	@JsonView(View.Company.Detail.class)
	private String size;

	// Write ONLY property

	@Column(name = "IS_COMPANY_EMAIL_VERIFIED")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private boolean isEmailVerified = false;

	@Column(name = "IS_COMPANY_PHONE_VERIFIED")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private boolean isPhoneVerified = false;

}
