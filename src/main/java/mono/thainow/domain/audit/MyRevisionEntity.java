package mono.thainow.domain.audit;

import javax.persistence.Entity;

import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.RevisionEntity;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.user.UserRole;

@Entity
@Getter
@Setter
@RevisionEntity(MyRevisionListener.class)
public class MyRevisionEntity extends DefaultRevisionEntity {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String modifierUser;
	
	private UserRole modifierRole;
	
	private String modifierEmail;	
	
}