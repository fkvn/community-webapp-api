package mono.thainow.domain.user;

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import mono.thainow.view.View;
import org.springframework.security.core.GrantedAuthority;

@Getter
@JsonView(View.Basic.class)
public enum UserPrivilege implements GrantedAuthority {

    USER_MANAGE(Code.USER_MANAGE), GUIDEBOOK_CREATE(Code.GUIDEBOOK_CREATE);

    private final String authority;

    UserPrivilege(String authority) {
        this.authority = authority;
    }

    @Override
    public String getAuthority() {
        return authority;
    }

    public class Code {
        public static final String USER_MANAGE = "USER_MANAGE";

        public static final String GUIDEBOOK_CREATE = "GUIDEBOOK_CREATE";
    }
}
