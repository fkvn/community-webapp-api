package mono.thainow.domain.audit;

import org.hibernate.envers.RevisionListener;

import mono.thainow.domain.user.UserRole;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.util.AuthUtil;

public class MyRevisionListener implements RevisionListener {

	private UserDetailsImpl getUser() {
		return  AuthUtil.getAuthorizedUser();
	}

	@Override
	public void newRevision(Object revisionEntity) {
		MyRevisionEntity myRevisionEntity = (MyRevisionEntity) revisionEntity;
		myRevisionEntity.setModifierUser(getUsername());
		myRevisionEntity.setModifierEmail(getUserEmail());
		myRevisionEntity.setModifierRole(getUserRole());
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

}
