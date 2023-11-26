package mono.thainow.domain.audit;

import mono.thainow.domain.user.UserRole;
import mono.thainow.service.impl.UserDetailsImpl;
import org.hibernate.envers.RevisionListener;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

public class MyRevisionListener implements RevisionListener {

    @Override
    public void newRevision(Object revisionEntity) {
        MyRevisionEntity myRevisionEntity = (MyRevisionEntity) revisionEntity;
        myRevisionEntity.setModifierUser(getUsername());
        myRevisionEntity.setModifierEmail(getUserEmail());
        myRevisionEntity.setModifierRole(getUserRole());
        myRevisionEntity.setClientIpAddress(getClientIpAddress());
    }

    private UserDetailsImpl getUser() {
        if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
            return null;
        }
        return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }

    private String getUsername() {
        return getUser() == null ? "anonymousUser" : getUser().getUsername();
    }

    private String getUserEmail() {
        return getUser() == null ? null : getUser().getEmail();
    }

    private UserRole getUserRole() {
        return getUser() == null ? null : getUser().getRole();
    }

    private String getClientIpAddress() {
        Object details = SecurityContextHolder.getContext().getAuthentication().getDetails();
        if (details instanceof WebAuthenticationDetails)
            return ((WebAuthenticationDetails) details).getRemoteAddress();
        return "unknown";
    }
}
