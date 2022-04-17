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
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(indexes = { @Index(name = "user_sub_UNIQUE", columnList = "USER_SUB", unique = true)})
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "USER_ROLE", discriminatorType = DiscriminatorType.STRING)
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

	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@NotNull(message = "User password can't be null")
	@Column(name = "USER_PASSWORD")
	@Type(type = "text")
	private String password;

//	@Email(message = "Email is not valid", regexp = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
	@Column(name = "USER_EMAIL")
	private String email;

	@Column(name = "IS_USER_EMAIL_VERIFIED")
	private boolean isEmailVerified = false;

	@Column(name = "USER_FIRSTNAME")
	private String firstName = "";

	@Column(name = "USER_LASTNAME")
	private String lastName = "";

	@Column(name = "USER_FULLNAME")
	private String fullName = firstName + lastName;

	@Column(name = "USER_USERNAME")
	private String username;

	@Column(name = "USER_PHONE")
	private String phone;

	@Column(name = "IS_USER_PHONE_VERIFIED")
	private boolean isPhoneVerified = false;

	@ElementCollection(fetch = FetchType.LAZY)
	@CollectionTable(name = "USER_PRIVILEGES", joinColumns = @JoinColumn(name = "USER_ID"))
	@Column(name = "USER_PRIVILEGES", nullable = false)
	private Set<UserPrivilege> privileges = new HashSet<>();

	@NotNull
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "USER_STATUS")
	private UserStatus status = UserStatus.ACTIVE;

	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "USER_CREATED_ON")
	private Date createdOn = new Date();
 
	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "USER_UPDATED_ON")
	private Date updatedOn = new Date();

	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	private Location location;
	
	@Transient
	public UserRole getRole() {
		return UserRole.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
	}

//	@OneToMany(fetch = FetchType.LAZY)
//	@JoinColumn(name = "AUTHOR_ID")
//	@NotNull
//	private List<Post> posts = new ArrayList<>();

	@PrePersist
	private void generateSecret() {
		this.setSub(UUID.randomUUID().toString());
		this.setFullName(firstName + " " + lastName);
	}

}
