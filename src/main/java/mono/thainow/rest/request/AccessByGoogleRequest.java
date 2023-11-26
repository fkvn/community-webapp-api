package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccessByGoogleRequest {

    // format returned from Google Sign In API

    private String sub;

    private String email;

    private Boolean email_verified;

    private String name;

    private String picture;

    private String given_name;

    private String family_name;

}
