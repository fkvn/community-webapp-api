package mono.thainow.domain.user;

import org.springframework.security.core.GrantedAuthority;

import lombok.Getter;

@Getter
public enum UserPrivilege implements GrantedAuthority {
	
	USER_MANAGE(Code.USER_MANAGE);
	
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
    }
}
