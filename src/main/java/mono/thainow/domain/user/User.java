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
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.post.Post;
import mono.thainow.domain.storage.Storage;

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
	

	@Id
	@GeneratedValue
	private Long id;

	@NotNull
	@Column(name = "USER_SUB")
	private String sub;
	
	@NotNull
	@Column(name = "USER_ROLE")
	@Enumerated(EnumType.STRING)
	private UserRole role = UserRole.CLASSIC;

	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@NotNull(message = "User password can't be null")
	@Column(name = "USER_PASSWORD")
	private String password;

	@Email(message = "Email is not valid")
	@Column(name = "USER_EMAIL")
	private String email;

	@Column(name = "IS_USER_EMAIL_VERIFIED")	
	private boolean isEmailVerified = false;
	
	@Column(name = "IS_USER_EMAIL_PUBLIC")
	private boolean isEmailPublic = false;

	@Column(name = "USER_FIRSTNAME")
	private String firstName = "";

	@Column(name = "USER_LASTNAME")
	private String lastName = "";

	@Column(name = "USER_FULLNAME")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String fullName = firstName + lastName;

	@Column(name = "USER_USERNAME")
	private String username = "";

	@Column(name = "USER_PHONE")
	private String phone;

	@Column(name = "IS_USER_PHONE_PUBLIC")
	private boolean isPhonePublic = false;
	
	@Column(name = "IS_USER_PHONE_VERIFIED")
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
	private UserStatus status;

	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "USER_CREATED_ON")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private Date createdOn = new Date();

	@UpdateTimestamp
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "USER_UPDATED_ON")
	private Date updatedOn = new Date();

	@ManyToOne	
	@JoinColumn(name = "LOCATION_ID")
	private Location location;
	
	@OneToMany(mappedBy = "administrator")
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
	@JsonIdentityReference(alwaysAsId = true)
	private List<Company> companies = new ArrayList<>();
	
	@OneToOne
	private Storage profileUrl;

//	@Transient
//	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
//	public UserRole getRole() {
//		return UserRole.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
//	}

	@NotNull
	@OneToMany(mappedBy = "author", fetch = FetchType.LAZY)
	@JsonIgnore
	private List<Post> posts = new ArrayList<>();
	
	@PrePersist
	private void validateUser() {
		this.setSub(UUID.randomUUID().toString());
		this.setFullName(this.firstName + " " + this.lastName);
		
	}
	
	@Transient
	public String getDisplayName() {
		return !this.username.isEmpty() ? this.username : this.fullName;
	}

}
