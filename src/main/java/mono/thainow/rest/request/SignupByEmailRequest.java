package mono.thainow.rest.request;

import lombok.Getter;

@Getter
public class SignupByEmailRequest {

    private String firstname;

    private String lastname;
    
    private String email;

    private String password;
}
