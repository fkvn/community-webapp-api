package mono.thainow.security.verify;

import org.springframework.stereotype.Component;

import com.twilio.Twilio;
import com.twilio.rest.verify.v2.service.Verification;
import org.springframework.util.Assert;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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

	public boolean sendAverficationToken(String phone, boolean isUSNumber, String email, String channel) {

		Verification verification = null;
		boolean isSent = false;

		switch (channel) {
		case "email": {
//			email is required
			Assert.isTrue(email != null && !email.equals(""), "Email is required for the verification process!");

//			send verification code
			verification = Verification.creator(serviceID, email, channel).create();

//			flag sent is successful
			isSent = true;
		}
			break;

		case "sms": {
//			phone number is required
			Assert.isTrue(phone != null && !phone.equals(""), "Phone number is required for the verification process!");

//			phone format 10-digits: xxxxxxxxxx
			if (isUSNumber) {
//				receiver format 10-digits: +1xxxxxxxxxx
				String receiver = "+1" + phone;

//				send verification code
				verification = Verification.creator(serviceID, receiver, channel).create();

//				flag sent is successful
				isSent = true;
			}
		}
			break;

		default:
			break;
		}

		Assert.isTrue(verification != null, "Verification Failed");

		return isSent;
	}
	
	public boolean checkAverficationToken(String phone, boolean isUSNumber, String email, String channel) {

		Verification verification = null;
		boolean isSent = false;

		switch (channel) {
		case "email": {
//			email is required
			Assert.isTrue(email != null && !email.equals(""), "Email is required for the verification process!");

			verification = Verification.creator(serviceID, email, channel).create();

			isSent = true;
		}
			break;

		case "sms": {
//			phone number is required
			Assert.isTrue(phone != null && !phone.equals(""), "Phone number is required for the verification process!");

//			phone format 10-digits: xxxxxxxxxx
			if (isUSNumber) {
//				receiver format 10-digits: +1xxxxxxxxxx
				String receiver = "+1" + phone;

				verification = Verification.creator(serviceID, receiver, channel).create();

				isSent = true;
			}
		}
			break;

		default:
			break;
		}

		Assert.isTrue(verification != null, "Verification Failed");

		return isSent;
	}
	

}
