package mono.thainow.rest.request;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@Getter
@Setter
public class SendTokenRequest {

    @Size(max = 15,
            message = "Phone number can't be more than 15 digit numbers")
    private String phone = "";

    @Size(max = 2, message = "Region can't be more than 2 characters")
    private String region = "us";

    @Size(max = 50, message = "Email can't be more than 50 characters")
    @Email
    private String email = "";

    @NotEmpty(message = "Channel can't be empty")
    private String channel = "";

}
