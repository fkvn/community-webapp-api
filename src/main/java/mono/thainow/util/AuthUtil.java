package mono.thainow.util;

import org.springframework.security.core.context.SecurityContextHolder;

import mono.thainow.service.impl.UserDetailsImpl;

public class AuthUtil {

	public static UserDetailsImpl getAuthorizedUser() {

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return null;
		}

		return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

}
