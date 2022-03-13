package mono.thainow.domain.user;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import javax.persistence.OrderColumn;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

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
public class User implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "USER_ID")
	private Long id;
	
	@NotNull(message = "User sub can't be null")
	@Column(name = "USER_SUB", unique = true)
	private String sub;

	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@NotNull(message = "User password can't be null")
	@Column(name = "USER_PASSWORD")
	private String password;

	@Email(message = "Email is not valid", regexp = "(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])")
	@Column(name = "USER_EMAIL", unique = true)
	private String email;
	
	@Column(name = "USER_ISEMAILVERIFIED")
	private boolean isEmailVerified = false;
	
	@Column(name = "USER_FIRSTNAME")
	private String firstName = "";
	
	@Column(name = "USER_LASTNAME")
	private String lastName = "";
	
	@Column(name = "USER_FULLNAME")
	private String fullName = firstName + lastName;
	
	@Column(name = "USER_USERNAME")
	private String username = "";

	@Column(name = "USER_PHONE", unique = true)
	private String phone;
	
	
	@ElementCollection(fetch = FetchType.EAGER)
	@CollectionTable(name = "USER_ROLES",
			joinColumns = @JoinColumn(name = "USER_ID"))
	@Column(name = "USER_ROLE")
	private List<String> roles = new ArrayList<>();

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
