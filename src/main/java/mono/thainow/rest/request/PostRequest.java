package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.notification.NotificationVia;
import mono.thainow.domain.post.PostType;

@Getter
public class PostRequest {
    private final boolean isPostAsAnonymous = false;
    private final NotificationVia notificationVia = null;
    
    @Setter
    private PostType postType = null;


}
