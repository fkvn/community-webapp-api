package mono.thainow.domain.profile;

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.domain.user.User;
import mono.thainow.view.View;
import org.hibernate.envers.Audited;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("USER_PROFILE")
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
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
