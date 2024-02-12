package mono.thainow.service.impl;

import com.twilio.rest.verify.v2.service.Verification;
import com.twilio.rest.verify.v2.service.VerificationCheck;
import mono.thainow.exception.BadRequest;
import mono.thainow.rest.request.SendTokenRequest;
import mono.thainow.rest.request.VerifyTokenRequest;
import mono.thainow.security.verify.TwilioVerification;
import mono.thainow.service.EmailService;
import mono.thainow.service.PhoneService;
import mono.thainow.service.TwilioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.List;

import static org.apache.commons.lang3.StringUtils.isBlank;

@Service
public class TwilioServiceImpl implements TwilioService {

    @Autowired
    TwilioVerification twilioVerification;

    @Autowired
    PhoneService phoneService;

    @Autowired
    EmailService emailService;

    @Override
    public void sendVerificationToken(SendTokenRequest request) {

        String channel = request.getChannel();
        List<String> authorizedChannels = new ArrayList<>();
        authorizedChannels.add("email");
        authorizedChannels.add("sms");

        if (isBlank(channel) || !authorizedChannels.contains(channel.toLowerCase()))
            throw new BadRequest("Only Email and SMS are supported at the moment!");

        String receiver = "";

        switch (channel.trim()) {
            case "email": {
                String email = request.getEmail();
                receiver = emailService.validateEmail(email);
            }
            break;

            case "sms": {
                String phone = request.getPhone();
                String region = request.getRegion();
                receiver = phoneService.getValidatedPhoneNumberWithRegionCode(phone, region);
            }
            break;

            default:
                break;
        }

        //		send verification token
        Verification verification =
                Verification.creator(twilioVerification.getServiceID(), receiver, channel).create();

        //		assert the verification token was sent
        Assert.isTrue(verification != null && verification.getStatus().equals("pending"),
                "Sending Verification Failed");

    }

    @Override
    public void checkVerificationToken(VerifyTokenRequest request) {

        String channel = request.getChannel();
        List<String> authorizedChannels = new ArrayList<>();
        authorizedChannels.add("email");
        authorizedChannels.add("sms");

        if (isBlank(channel) || !authorizedChannels.contains(channel.toLowerCase()))
            throw new BadRequest("Only Email and SMS are supported at the moment!");

        String token = request.getOtpToken();
        if (isBlank(token)) throw new BadRequest("Token can't be empty!");

        String receiver = "";

        switch (channel) {

            case "email": {
                String email = request.getEmail();
                receiver = emailService.validateEmail(email);
            }
            break;

            case "sms": {
                String phone = request.getPhone();
                String region = request.getRegion();
                receiver = phoneService.getValidatedPhoneNumberWithRegionCode(phone, region);
            }
            break;

            default:
                break;
        }

        VerificationCheck verificationCheck =
                VerificationCheck.creator(twilioVerification.getServiceID(), token.trim())
                        .setTo(receiver).create();

        Assert.isTrue(verificationCheck.getStatus().equals("approved"),
                "Token Verification Failed. Please try again or request a new code!!!");
    }

}
