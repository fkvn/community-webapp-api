package mono.thainow.service;

import mono.thainow.rest.request.SendTokenRequest;
import mono.thainow.rest.request.VerifyTokenRequest;

public interface TwilioService {
    void sendVerificationToken(SendTokenRequest request);

    void checkVerificationToken(VerifyTokenRequest request);
}
