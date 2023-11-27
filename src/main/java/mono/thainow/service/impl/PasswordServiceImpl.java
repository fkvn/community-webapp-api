package mono.thainow.service.impl;

import mono.thainow.exception.BadRequest;
import mono.thainow.service.PasswordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class PasswordServiceImpl implements PasswordService {

    @Autowired
    private PasswordEncoder encoder;

    @Override
    public Boolean isPasswordValid(String password) {
        String PASSWORD_PATTERN = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,20}$";
        Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }

    @Override
    public String validatePassword(String password) {
        Boolean isPasswordValid = isPasswordValid(password);
        if (!isPasswordValid) {
            throw new BadRequest("8 to 20 characters (1 upper, 1 lower, 1 number, and no white space)");
        }
        return password;
    }

    @Override
    public String encodePassword(String password) {
        return encoder.encode(password);
    }
}
