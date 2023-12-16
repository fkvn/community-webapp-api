package mono.thainow.annotation;

import org.springframework.security.access.prepost.PreAuthorize;

import java.lang.annotation.*;

@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@PreAuthorize("hasAnyAuthority('ROLE_CLASSIC', 'ROLE_BUSINESS', 'ROLE_STAFF', 'ROLE_ADMIN', " +
        "'ROLE_SUPER_ADMIN', 'ROLE_CONTRIBUTOR')")
public @interface AuthenticatedAccess {

}
