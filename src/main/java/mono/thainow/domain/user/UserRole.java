package mono.thainow.domain.user;

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import mono.thainow.view.View;

@Getter
@JsonView(View.Basic.class)
public enum UserRole {

    SUPERADMIN, ADMIN, STAFF, CLASSIC, BUSINESS

}
