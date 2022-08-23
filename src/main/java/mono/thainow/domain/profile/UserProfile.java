package mono.thainow.domain.profile;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.storage.Storage;
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
		this.setAccount(user);
	}

	@Override
	public String getUsername() {
		return this.getAccount().getUsername();
	}

	@Override
	public ProfileStatus getStatus() {
		switch (this.getAccount().getStatus()) {
		case ACTIVATED:
			return ProfileStatus.ACTIVATED;
		case DISABLED:
			return ProfileStatus.DISABLED;
		default:
			return ProfileStatus.DELETED;
		}
	}

	@Override
	public Storage getPicture() {
		return this.getAccount().getPicture();
	}

	@Override
	public Object getDetailInfo() {
		
//		User user = this.getAccount();
//		
//		if (!user.isEmailPublic()) user.setEmail(null);
//		if (!user.isPhonePublic()) user.setPhone(null);
//		if (!user.isDescriptionPublic()) user.setDescription(null);
//		if (!user.isWebsitePublic()) user.setWebsite(null);
		
		return this.getAccount();
	}

}
