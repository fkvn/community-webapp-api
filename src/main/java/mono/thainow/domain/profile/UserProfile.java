package mono.thainow.domain.profile;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.user.User;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("USER_PROFILE")
public class UserProfile extends Profile {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public UserProfile(User user) {
		this.setUsername(user.getUsername());
		this.setUserId(user.getId());
	}
	
	@Column(name = "USER_ID")
	private Long userId;

}
