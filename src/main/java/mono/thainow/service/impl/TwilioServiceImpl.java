package mono.thainow.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.twilio.rest.verify.v2.service.Verification;
import com.twilio.rest.verify.v2.service.VerificationCheck;

import mono.thainow.security.verify.TwilioVerification;
import mono.thainow.service.TwilioService;
import mono.thainow.util.PhoneUtil;

@Service
public class TwilioServiceImpl implements TwilioService {

	@Autowired
	TwilioVerification twilioVerification;

	@Override
	public void sendVerficationToken(String phone, String region, String email, String channel) {
//		only verify by email and sms
		Assert.isTrue(channel.equals("email") || channel.equals("sms"),
				"Only Email and SMS are supported at the moment!");

//		verification object
		Verification verification = null;

//		validate receiver process
		String receiver = "";

		switch (channel) {
		case "email": {
//			email is required
			Assert.isTrue(!email.isBlank(), "Email is required for the verification process!");

//			update receiver
			receiver = email;

		}
			break;

		case "sms": {
//			phone number is required
			Assert.isTrue(!phone.isBlank(), "Phone number is required for the verification process!");

//			update receiver
			receiver = PhoneUtil.getPhoneNumberWithRegionCode(phone, region);

		}
			break;

		default:
			break;
		}

//		assert the receiver is not empty
		Assert.isTrue(!receiver.isEmpty(), "Missing receiver!");

//		send verification token
		verification = Verification.creator(twilioVerification.getServiceID(), receiver, channel).create();

//		assert the verification token was sent
		Assert.isTrue(verification != null && verification.getStatus().equals("pending"),
				"Sending Verification Failed");

	}

	@Override
	public void checkVerficationToken(String phone, String region, String email, String channel, String token) {
//		token is required
		Assert.isTrue(!token.isBlank(), "Token can't be empty!");

//		validate receiver process
		String receiver = "";

		switch (channel) {

		case "email": {
//			email is required
			Assert.isTrue(!email.isBlank(), "Email is required for the verification process!");

//			update receiver
			receiver = email;
		}
			break;

		case "sms": {
//			phone number is required
			Assert.isTrue(!phone.isBlank(), "Phone number is required for the verification process!");

//			update receiver
			receiver = PhoneUtil.getPhoneNumberWithRegionCode(phone, region);
		}
			break;

		default:
			break;
		}

//		assert the receiver is not empty
		Assert.isTrue(!receiver.isBlank(), "Missing receiver!");

//		validate token
		VerificationCheck verificationCheck = VerificationCheck.creator(twilioVerification.getServiceID(), token)
				.setTo(receiver).create();
		
		Assert.isTrue(verificationCheck.getStatus().equals("approved"), "Token Verification Failed. Please try again or request a new code!!!");
		
	}

}
