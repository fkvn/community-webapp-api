package mono.thainow.rest.request;

import lombok.Getter;

@Getter
public class ModifyProfileRequest {
    
    private String username;

    private String firstname;

    private String lastname;

    private String email;

    private Boolean isEmailPublic;

    private String phone;

    private String phoneRegion;

    private Boolean isPhonePublic;

//    private String address;
//
//    private String placeid;

}
