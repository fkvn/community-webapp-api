package mono.thainow.domain.user;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
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
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.Transient;

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
@Table(indexes = { @Index(name = "user_sub_UNIQUE", columnList = "USER_SUB", unique = true) })
//@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
//@DiscriminatorColumn(name = "USER_ROLE", discriminatorType = DiscriminatorType.STRING)
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

	@NotEmpty
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
	private Storage profileUrl;
	
	@Transient
	@JsonView(View.UserView.Public.class)
	public Map<String, Object> getContactInformation() {
		Map<String, Object> contactInformation = new HashMap<>();
		
		if (isEmailPublic) {
			contactInformation.put("email", email);
		}
		
		if (isPhonePublic) {
			contactInformation.put("phone", phone);
		}
		
		if (isLocationPublic) {
			contactInformation.put("location", location);
		}
		
		return contactInformation;
	}
	
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
	
	@Email(message = "Email is not valid")
	@JsonView(View.UserView.Private.class)
	@Column(name = "USER_EMAIL")
	private String email;
	
	@Column(name = "IS_USER_EMAIL_PUBLIC")
	@JsonProperty(value="isEmailPublic") 
	@JsonView(View.UserView.Private.class)
	private boolean isEmailPublic = false;
	
	@Column(name = "USER_PHONE")
	@JsonView(View.UserView.Private.class)
	private String phone;

	@Column(name = "IS_USER_PHONE_PUBLIC")
	@JsonProperty(value="isPhonePublic") 
	@JsonView(View.UserView.Private.class)
	private boolean isPhonePublic = false;
	
	@ManyToOne	
	@JoinColumn(name = "LOCATION_ID")
	@JsonView(View.UserView.Private.class)
	private Location location;
	
	@Column(name = "IS_USER_LOCATION_PUBLIC")
	@JsonView(View.UserView.Private.class)
	@JsonProperty(value="isLocationPublic") 
	private boolean isLocationPublic = false;
	
	
	// Write ONLY property
	
	@NotNull
	@Column(name = "USER_SUB")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String sub;
	
	@NotNull
	@Column(name = "USER_SOURCE")
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

	// Request ONLY property 

//	@OneToMany(mappedBy = "administrator", fetch = FetchType.LAZY)
//	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
//	@JsonIdentityReference(alwaysAsId = true)
//	private List<Company> companies = new ArrayList<>();
//	
//	@NotNull
//	@OneToMany(mappedBy = "author", fetch = FetchType.LAZY)
//	@JsonIgnore
//	private List<Post> posts = new ArrayList<>();
	
	
	// Config
	
	@PrePersist
	private void validateUser() {
		this.setSub(UUID.randomUUID().toString());
		this.setFullName(this.firstName + " " + this.lastName);
	}
	

}
