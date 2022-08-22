package mono.thainow.domain.audit;

import org.hibernate.envers.RevisionListener;

import mono.thainow.domain.user.UserRole;
import mono.thainow.util.AuthUtil;

public class MyRevisionListener implements RevisionListener {

	@Override
	public void newRevision(Object revisionEntity) {
		MyRevisionEntity myRevisionEntity = (MyRevisionEntity) revisionEntity;
        myRevisionEntity.setModifierUser(getUsername());
        myRevisionEntity.setModifierEmail(getUserEmail());
        myRevisionEntity.setModifierRole(getUserRole());
	}
	
    private String getUsername(){
        return AuthUtil.getAuthorizedUser().getUsername();
    }
    
    private String getUserEmail() {
    	return AuthUtil.getAuthorizedUser().getEmail();
    }
    
    private UserRole getUserRole() {
    	return AuthUtil.getAuthorizedUser().getRole();
    }

}
