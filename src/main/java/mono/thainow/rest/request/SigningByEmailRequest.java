package mono.thainow.rest.request;

import lombok.Getter;

@Getter
public class SigningByEmailRequest {

    private String email;

    private String password;
}
