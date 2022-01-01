package mono.thainow.util;

import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber.PhoneNumber;

public class PhoneValidationWithGoogleAPI {

	public boolean validatePhoneNumber(String[] phoneNumbers, String region) throws NumberParseException {

		boolean isValid = false;
		PhoneNumberUtil numberUtil = PhoneNumberUtil.getInstance();

		for (String number : phoneNumbers) {

			PhoneNumber phoneNumber = numberUtil.parse(number, region);

			isValid = numberUtil.isValidNumber(phoneNumber);

		}

		return isValid;

	}
}
