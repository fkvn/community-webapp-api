package mono.thainow.rest.request;

import lombok.Getter;

@Getter
public class SigningByPhoneRequest {

    private String phone;

    private String region;

    private String password;
}
