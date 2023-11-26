package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccessByFacebookRequest {

    private String id;

    private String email;

    private Boolean isEmailVerified;

    private String name;

    private String picture;

}
