package mono.thainow.service.impl;

import com.twilio.rest.verify.v2.service.Verification;
import com.twilio.rest.verify.v2.service.VerificationCheck;
import mono.thainow.rest.request.SendTokenRequest;
import mono.thainow.rest.request.VerifyTokenRequest;
import mono.thainow.security.verify.TwilioVerification;
import mono.thainow.service.PhoneService;
import mono.thainow.service.TwilioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

@Service
public class TwilioServiceImpl implements TwilioService {

    @Autowired
    TwilioVerification twilioVerification;

    @Autowired
    PhoneService phoneService;

    @Override
    public void sendVerificationToken(SendTokenRequest request) {

        String channel = request.getChannel();
        Assert.isTrue(!channel.isBlank() && (channel.equals("email") || channel.equals("sms")),
                "Only Email and SMS are supported at the moment!");

        String receiver = "";

        switch (channel.trim()) {
            case "email": {
                String email = request.getEmail();
                Assert.isTrue(!email.isBlank(), "Email can't be empty");
                receiver = email.trim();
            }
            break;

            case "sms": {
                String phone = request.getPhone();
                String region = request.getRegion();
                receiver = phoneService.getValidatedPhoneNumberWithRegionCode(phone.trim(), region.trim());
            }
            break;

            default:
                break;
        }

//		send verification token
        Verification verification = Verification.creator(twilioVerification.getServiceID(), receiver, channel).create();

//		assert the verification token was sent
        Assert.isTrue(verification != null && verification.getStatus().equals("pending"),
                "Sending Verification Failed");

    }

    @Override
    public void checkVerificationToken(VerifyTokenRequest request) {

        String channel = request.getChannel();
        Assert.isTrue(!channel.isBlank() && (channel.equals("email") || channel.equals("sms")),
                "Only Email and SMS are supported at the moment!");

        String token = request.getOtpToken();
        Assert.isTrue(!token.isBlank(), "Token can't be empty!");

        String receiver = "";

        switch (channel.trim()) {

            case "email": {
                String email = request.getEmail();
                Assert.isTrue(!email.isBlank(), "Email can't be empty");
                receiver = email.trim();
            }
            break;

            case "sms": {
                String phone = request.getPhone();
                String region = request.getRegion();
                Assert.isTrue(!phone.isBlank() && !region.isBlank(), "Phone or Region can't be empty!");
                receiver = phoneService.getValidatedPhoneNumberWithRegionCode(phone.trim(), region.trim());
            }
            break;

            default:
                break;
        }

        VerificationCheck verificationCheck = VerificationCheck.creator(twilioVerification.getServiceID(), token.trim())
                .setTo(receiver).create();

        Assert.isTrue(verificationCheck.getStatus().equals("approved"), "Token Verification Failed. Please try again or request a new code!!!");
    }

}
