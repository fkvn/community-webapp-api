package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AccessByLineRequest {

    private String sub;

    private String email;

//	private Boolean email_verified;

    private String name;

//	private String picture;

}
