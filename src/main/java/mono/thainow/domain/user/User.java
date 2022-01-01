package mono.thainow.domain.user;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.post.Post;

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

	@JsonIgnore
	@NotNull(message = "User password can't be null")
	@Column(name = "USER_PASSWORD")
	private String password;

	@Email
	@Column(name = "USER_EMAIL", unique = true)
	private String email;

	@NotNull(message = "User phone number can't be null")
	@NotBlank(message = "Please enter your phone number")
	@Pattern(regexp = "(\\+1)[0-9]{10}")
	@Column(name = "USER_PHONE", unique = true)
	private String phone;
	
	
	@NotNull
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "USER_STATUS")
	private UserStatus status;

	// post
	@OneToMany(fetch = FetchType.LAZY)
	@JoinColumn(name = "AUTHOR_ID")
	@NotNull
	private List<Post> posts = new ArrayList<>();
}
