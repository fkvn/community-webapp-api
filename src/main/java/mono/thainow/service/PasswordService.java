package mono.thainow.service;

public interface PasswordService {

    Boolean isPasswordValid(String password);

    String validatePassword(String password);

    String encodePassword(String password);
}
