package mono.thainow.rest.controller;

import com.fasterxml.jackson.annotation.JsonView;
import mono.thainow.rest.request.*;
import mono.thainow.rest.response.JwtResponse;
import mono.thainow.rest.response.MessageResponse;
import mono.thainow.service.AuthService;
import mono.thainow.service.UserService;
import mono.thainow.view.View;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

// 30 secs
@CrossOrigin(origins = "*", maxAge = 36000)
@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    PasswordEncoder encoder;
    @Autowired
    private AuthService authService;
    @Autowired
    private UserService userService;

    @PostMapping("/otp")
    public MessageResponse getToken(
            @Valid @RequestBody SendTokenRequest tokenRequest) {

        authService.sendVerificationToken(tokenRequest);

        return new MessageResponse("Token was sent successfully!");
    }

    @PostMapping("/otp/verify")
    public MessageResponse verifyToken(
            @Valid @RequestBody VerifyTokenRequest tokenResponse) {

        authService.checkVerificationToken(tokenResponse);

        return new MessageResponse("Token was verified successfully!");
    }


    @PostMapping("/signingByEmail")
    @JsonView(View.Basic.class)
    public JwtResponse signingByEmail(@Valid @RequestBody SigningByEmailRequest request) {
        return authService.signingWithThaiNowByEmail(request);
    }

    @PostMapping("/signingByPhone")
    @JsonView(View.Basic.class)
    public JwtResponse signingByPhone(@Valid @RequestBody SigningByPhoneRequest request) {
        return authService.signingWithThaiNowByPhone(request);
    }

    @PostMapping("/signupByEmail")
    public Long signupByEmail(@Valid @RequestBody SignupByEmailRequest request) {
        Long userId = authService.signupWithThaiNowByEmail(request);
        return userId;
    }

    @PostMapping("/google/access")
    @JsonView(View.Basic.class)
    public JwtResponse accessWithGoogle(
            @Valid @RequestBody AccessByGoogleRequest request) {
        return authService.accessWithGoogle(request);
    }

    @PostMapping("/apple/access")
    @JsonView(View.Basic.class)
    public JwtResponse accessWithApple(
            @Valid @RequestBody AccessByAppleRequest signupRequest) {
        return authService.accessWithApple(signupRequest);
    }

    @PostMapping("/facebook/access")
    @JsonView(View.Basic.class)
    public JwtResponse accessWithFacebook(
            @Valid @RequestBody AccessByFacebookRequest request) {
        return authService.accessWithFacebook(request);
    }

    @PostMapping("/line/access")
    @JsonView(View.Basic.class)
    public JwtResponse accessWithLine(
            @Valid @RequestBody AccessByLineRequest request) {
        return authService.accessWithLine(request);
    }

}
