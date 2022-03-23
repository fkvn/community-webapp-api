package mono.thainow.domain.user;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

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
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.Type;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(indexes = {
		  @Index(name = "user_sub_UNIQUE", columnList = "USER_SUB", unique = true),
		  @Index(name = "user_email_UNIQUE", columnList = "USER_EMAIL", unique = true),
		  @Index(name = "user_phone_UNIQUE", columnList = "USER_PHONE", unique = true),
		  @Index(name = "user_username_UNIQUE", columnList = "USER_USERNAME", unique = true),
		})
public class User implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "USER_ID")
	private Long id;
	
	@NotNull
	@Column(name = "USER_SUB")
	private String sub;

	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@NotNull(message = "User password can't be null")
	@Column(name = "USER_PASSWORD")
	@Type(type="text")
	private String password;

//	@Email(message = "Email is not valid", regexp = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
	@Column(name = "USER_EMAIL")
	private String email;
	
	@Column(name = "USER_ISEMAILVERIFIED")
	private boolean isEmailVerified;
	
	@Column(name = "USER_FIRSTNAME")
	private String firstName = "";
	
	@Column(name = "USER_LASTNAME")
	private String lastName = "";
	
	@Column(name = "USER_FULLNAME")
	private String fullName = firstName + lastName;
	
	@Column(name = "USER_USERNAME")
	private String username = "";

	@Column(name = "USER_PHONE")
	private String phone;
	
	@Column(name = "USER_ISPHONEVERIFIED")
	private boolean isPhoneVerified;
	
	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "USER_ROLES",
			joinColumns = @JoinColumn(name = "USER_ID"))
	@Column(name = "USER_ROLE", nullable = false)
	private Set<UserRole> roles = new HashSet<>();

	@NotNull
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "USER_STATUS")
	private UserStatus status = UserStatus.ACTIVE ;

	@CreationTimestamp
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss")
	@Column(name = "USER_CREATED_ON")
	private Date createdOn = new Date(); 

//	@OneToMany(fetch = FetchType.LAZY)
//	@JoinColumn(name = "AUTHOR_ID")
//	@NotNull
//	private List<Post> posts = new ArrayList<>();
	
}
