package mono.thainow.domain.audit;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.user.UserRole;
import org.hibernate.envers.DefaultRevisionEntity;
import org.hibernate.envers.RevisionEntity;

import javax.persistence.Entity;

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

    private String clientIpAddress;

}