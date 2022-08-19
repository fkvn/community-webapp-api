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

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
public class User implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	// public property

	@Id
	@GeneratedValue
	@JsonView(View.UserView.Public.class)
	private Long id;

	@Column(name = "USER_USERNAME")
	@JsonView(View.UserView.Public.class)
	private String username = "";

	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "USER_CREATED_ON")
	@JsonView(View.UserView.Public.class)
	private Date createdOn = new Date();
	
	@OneToOne
	@JsonView(View.UserView.Public.class)
	private Storage picture;

	// private property

	@UpdateTimestamp
	@JsonView(View.UserView.Private.class)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "USER_UPDATED_ON")
	private Date updatedOn = new Date();

	@Column(name = "USER_FIRSTNAME")
	@JsonView(View.UserView.Private.class)
	private String firstName = "";

	@Column(name = "USER_LASTNAME")
	@JsonView(View.UserView.Private.class)
	private String lastName = "";
	
	@Lob
	@Column(name = "USER_DESCRIPTION")
	@JsonView(View.UserView.Private.class)
	private String description;
	
	@Column(name = "IS_USER_DESCRIPTION_PUBLIC")
	@JsonView(View.UserView.Private.class)
	private boolean isDescriptionPublic = false;

	@Email(message = "Email is not valid")
	@JsonView(View.UserView.Private.class)
	@Column(name = "USER_EMAIL")
	private String email;

	@Column(name = "IS_USER_EMAIL_PUBLIC")
	@JsonView(View.UserView.Private.class)
	private boolean isEmailPublic = false;

	@Column(name = "USER_PHONE")
	@JsonView(View.UserView.Private.class)
	private String phone;

	@Column(name = "IS_USER_PHONE_PUBLIC")
	@JsonView(View.UserView.Private.class)
	private boolean isPhonePublic = false;

	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	@JsonView(View.UserView.Private.class)
	private Location location;

	@Column(name = "IS_USER_LOCATION_PUBLIC")
	@JsonView(View.UserView.Private.class)
	private boolean isLocationPublic = false;
	
	@Column(name = "USER_WEBSITE")
	@JsonView(View.UserView.Private.class)
	@URL(regexp = "(?i)^(?:http://|https://).*", message = "Website url must be a valid URL")
	private String website;
	
	@Column(name = "IS_USER_WEBSITE_PUBLIC")
	@JsonView(View.UserView.Private.class)
	private boolean isWebsitePublic = false;
	
	@OneToMany
	private List<Storage> coverPictures = new ArrayList<>();

	// Write ONLY property

	@NotNull
	@Column(name = "USER_SUB")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String sub;

	@NotNull
	@Column(name = "USER_ISSUER")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String provider = "THAINOW";

	@NotNull
	@Column(name = "USER_ROLE")
	@Enumerated(EnumType.STRING)
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private UserRole role = UserRole.CLASSIC;

	@NotNull(message = "User password can't be null")
	@Column(name = "USER_PASSWORD")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String password;

	@Column(name = "USER_FULLNAME")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String fullName = firstName + lastName;

	@Column(name = "IS_USER_EMAIL_VERIFIED")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private boolean isEmailVerified = false;

	@Column(name = "IS_USER_PHONE_VERIFIED")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private boolean isPhoneVerified = false;

	@ElementCollection(fetch = FetchType.EAGER)
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@CollectionTable(name = "USER_PRIVILEGES", joinColumns = @JoinColumn(name = "USER_ID"))
	@Column(name = "USER_PRIVILEGES", nullable = false)
	private Set<UserPrivilege> privileges = new HashSet<>();

	@NotNull(message = "User status can't be null!")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@Enumerated(EnumType.STRING)
	@Column(name = "USER_STATUS")
	private UserStatus status = UserStatus.DEACTIVATED;

	// Config

	@PrePersist
	private void validateUser() {
		this.setSub(UUID.randomUUID().toString());

		if (this.fullName.equals("")) {
			this.setFullName(this.firstName + " " + this.lastName);
		}
	}

}
