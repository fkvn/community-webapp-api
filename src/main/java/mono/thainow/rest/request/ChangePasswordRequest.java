package mono.thainow.rest.request;

import lombok.Getter;

@Getter
public class ChangePasswordRequest {
    private String newPassword;
    private String currentPassword;
}
