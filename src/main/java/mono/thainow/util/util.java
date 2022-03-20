package mono.thainow.util;

import org.springframework.util.Assert;

import com.google.i18n.phonenumbers.NumberParseException;

public class util {

	public static boolean valPhoneNo(String phone) {

		boolean isPhoneValid = false;
		String[] arrPhones = { phone };

		try {
			isPhoneValid = new PhoneValidationWithGoogleAPI().validatePhoneNumber(arrPhones, "US");
		} catch (NumberParseException e) {
			// TODO Auto-generated catch block
		}

		Assert.isTrue(isPhoneValid, "Only US phone number is allowed at the moment!");
		
		return isPhoneValid;
	}
	
	public static boolean valMulPhoneNo(String[] arrPhones) {

		boolean isPhoneValid = false;

		try {
			isPhoneValid = new PhoneValidationWithGoogleAPI().validatePhoneNumber(arrPhones, "US");
		} catch (NumberParseException e) {
			// TODO Auto-generated catch block
		}
		
		Assert.isTrue(isPhoneValid, "Only US phone number is allowed at the moment!");

		return isPhoneValid;
	}
	
}
