package mono.thainow.domain.profile;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.user.User;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

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
    public Object getDetails() {
        return this.getAccount();
    }

}
