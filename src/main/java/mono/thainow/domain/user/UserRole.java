package mono.thainow.domain.user;

import org.springframework.security.core.GrantedAuthority;

import lombok.Getter;

@Getter
public enum UserRole implements GrantedAuthority {
	
	SUPERADMIN(Code.SUPERADMIN),
	
	ADMIN(Code.ADMIN), STAFF(Code.STAFF), CLASSIC(Code.CLASSIC), BUSINESS(Code.BUSINESS);
	
	private final String authority;

	UserRole(String authority) {
        this.authority = authority;
    }

    @Override
    public String getAuthority() {
        return authority;
    }

    public class Code {
    	public static final String SUPERADMIN = "ROLE_SUPERADMIN";
        public static final String ADMIN = "ROLE_ADMIN";
    	public static final String STAFF = "ROLE_STAFF";
        public static final String CLASSIC = "ROLE_CLASSIC";
        public static final String BUSINESS = "ROLE_BUSINESS";
    }
}
