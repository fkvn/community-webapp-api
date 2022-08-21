package mono.thainow.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.security.access.prepost.PreAuthorize;

@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@PreAuthorize("hasAnyAuthority('ROLE_CLASSIC', 'ROLE_BUSINESS', 'ROLE_STAFF', 'ROLE_ADMIN', 'ROLE_SUPERADMIN')")
public @interface AuthorizedAccess {

}
