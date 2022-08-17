package mono.thainow.domain.profile;

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
		setProfileInfo(user);
	}

	public void setProfileInfo(User user) {
		this.setAccount(user);
		this.setUsername(user.getUsername());
		this.setPicture(user.getPicture());
		this.setStatus(ProfileStatus.valueOf(user.getStatus().toString()));
	}

}
