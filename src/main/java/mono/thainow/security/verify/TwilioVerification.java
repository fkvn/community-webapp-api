package mono.thainow.security.verify;

import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import com.twilio.Twilio;
import com.twilio.rest.verify.v2.service.Verification;
import com.twilio.rest.verify.v2.service.VerificationCheck;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.util.PhoneUtil;

@Component
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class TwilioVerification {

	public static final String ACCOUNT_SID = System.getenv("TWILIO_ACCOUNT_SID");
	public static final String AUTH_TOKEN = System.getenv("TWILIO_AUTH_TOKEN");
	public static final String serviceID = System.getenv("TWILIO_OTP_SERVICE_ID");

	public TwilioVerification() {
		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	}

//	if no error, it went through
	public void sendVerficationToken(String phone, String region, String email, String channel) {

//		only verify by email and sms
		Assert.isTrue(channel.equals("email") || channel.equals("sms"), "Only Email and SMS are supported at the moment!");
		

		
//		verification object
		Verification verification = null;

//		validate receiver process
		String receiver = "";
	
		switch (channel) {
		case "email": {
//			email is required
			Assert.isTrue(email != null && !email.equals(""), "Email is required for the verification process!");

//			update receiver
			receiver = email;

		}
			break;

		case "sms": {
//			phone number is required
			Assert.isTrue(phone != null && !phone.equals(""), "Phone number is required for the verification process!");
			
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
		verification = Verification.creator(serviceID, receiver, channel).create();

//		assert the verification token was sent
		Assert.isTrue(verification != null && verification.getStatus().equals("pending"), "Sending Verification Failed");

	}
	
	
//	if no error, it went through
	public void checkVerficationToken(String phone, String region, String email, String channel, String token) {
		
//		token is required
		Assert.isTrue(!token.isEmpty(), "Token can't be empty!");

//		validate receiver process
		String receiver = "";

		switch (channel) {
		
		case "email": {
//			email is required
			Assert.isTrue(email != null && !email.equals(""), "Email is required for the verification process!");
			
//			update receiver
			receiver = email;
		}
			break;

		case "sms": {
//			phone number is required
			Assert.isTrue(phone != null && !phone.equals(""), "Phone number is required for the verification process!");
			
//			update receiver
			receiver = PhoneUtil.getPhoneNumberWithRegionCode(phone, region);
		}
			break;

		default:
			break;
		}
		
//		assert the receiver is not empty
		Assert.isTrue(!receiver.isEmpty(), "Missing receiver!");
		
//		validate token
        VerificationCheck verificationCheck = VerificationCheck.creator(
                serviceID,
                token)
            .setTo(receiver).create();

//		assert the verification token was approved
		Assert.isTrue(verificationCheck.getStatus().equals("approved"), "Token Verification Failed");
	}
	
}
