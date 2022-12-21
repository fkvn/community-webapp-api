package mono.thainow.domain.user;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.springframework.util.Assert;

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
import mono.thainow.domain.storage.Storage;
import mono.thainow.view.View;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@JsonView(View.Basic.class)
@Audited( withModifiedFlag = true )
public class User implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

//	Basic Information

	@Id
	@GeneratedValue
	@JsonIgnore
	private Long id;

	@Column(name = "USER_USERNAME")
	@JsonProperty("name")
	private String username = "";
	
	@OneToOne
	private Storage picture;
	
	@CreationTimestamp
	@JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
	@Column(name = "USER_CREATED_ON")
	private Date createdOn = new Date();
	
	@NotNull
	@Column(name = "USER_ISSUER")
	@Enumerated(EnumType.STRING)
	private UserProvider provider = UserProvider.THAINOW;
	
//  Detail Information
	
	@UpdateTimestamp
	@JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
	@Column(name = "USER_UPDATED_ON")
	@JsonView(View.Detail.class)
	private Date updatedOn = new Date();
	
	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	@JsonView(View.Detail.class)
	private Location location;
	
	@OneToMany
	@JsonView(View.Detail.class)
	private List<Storage> pictures = new ArrayList<>();
	
	@Lob
	@Column(name = "USER_DESCRIPTION")
	@JsonView(View.Detail.class)
	private String description;
	
	@Email(message = "Email is not valid")
	@Column(name = "USER_EMAIL")
	@JsonView(View.Detail.class)
	private String email;
	
	@Column(name = "USER_PHONE")
	@JsonView(View.Detail.class)
	private String phone;
	
	@Column(name = "USER_WEBSITE")
//	@URL(regexp = "(?i)^(?:http://|https://).*", message = "Website url must be a valid URL")
	@JsonView(View.Detail.class)
	private String website;

	@Column(name = "USER_FIRSTNAME")
	@JsonView(View.Detail.class)
	private String firstName = "";

	@Column(name = "USER_LASTNAME")
	@JsonView(View.Detail.class)
	private String lastName = "";
	
	@Column(name = "IS_USER_DESCRIPTION_PUBLIC")
	@JsonProperty("isDescriptionPublic")
	@JsonView(View.Detail.class)
	private boolean descriptionPublic = false;

	@Column(name = "IS_USER_EMAIL_PUBLIC")
	@JsonProperty("isEmailPublic")
	@JsonView(View.Detail.class)
	private boolean emailPublic = false;

	@Column(name = "IS_USER_PHONE_PUBLIC")
	@JsonProperty("isPhonePublic")
	@JsonView(View.Detail.class)
	private boolean phonePublic = false;

	@Column(name = "IS_USER_LOCATION_PUBLIC")
	@JsonProperty("isLocationPublic")
	@JsonView(View.Detail.class)
	private boolean locationPublic = false;
	
	@Column(name = "IS_USER_WEBSITE_PUBLIC")
	@JsonProperty("isWebsitePublic")
	@JsonView(View.Detail.class)
	private boolean websitePublic = false;

//	Full Detail Information
	
	
	@NotNull(message = "User status can't be null!")
	@Enumerated(EnumType.STRING)
	@Column(name = "USER_STATUS")
	@JsonView(View.FullDetail.class)
	private UserStatus status = UserStatus.DISABLED;
	
	@NotNull
	@Column(name = "USER_SUB")
	@JsonView(View.FullDetail.class)
	private String sub;

	@NotNull
	@Column(name = "USER_ROLE")
	@Enumerated(EnumType.STRING)
	@JsonView(View.FullDetail.class)
	private UserRole role = UserRole.CLASSIC;

	@Column(name = "USER_FULLNAME")
	@JsonView(View.FullDetail.class)
	private String fullName = firstName + lastName;

	@Column(name = "IS_USER_EMAIL_VERIFIED")
	@JsonView(View.FullDetail.class)
	private boolean isEmailVerified = false;

	@Column(name = "IS_USER_PHONE_VERIFIED")
	@JsonView(View.FullDetail.class)
	private boolean isPhoneVerified = false;

	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "USER_PRIVILEGES", joinColumns = @JoinColumn(name = "USER_ID"))
	@Column(name = "USER_PRIVILEGES", nullable = false)
	@JsonView(View.FullDetail.class)
	private Set<UserPrivilege> privileges = new HashSet<>();
	
//	Write ONLY information
	
	@Column(name = "USER_PASSWORD")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String password;

//	Configuration Setting

	@PrePersist
	private void validateUser() {
		this.setSub(UUID.randomUUID().toString());
		if (this.fullName.equals("")) {
			this.setFullName(this.firstName + " " + this.lastName);
		}
		
		Assert.isTrue(this.getPassword() != null, "User password can't be null");	}

}
