package mono.thainow.domain.notification;

import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import mono.thainow.view.View;

@Getter
@JsonView(View.Basic.class)
public enum NotificationVia {

    EMAIL, SMS

}
