package mono.thainow.util;

import org.springframework.util.Assert;

import com.google.i18n.phonenumbers.NumberParseException;
import com.google.i18n.phonenumbers.PhoneNumberUtil;
import com.google.i18n.phonenumbers.Phonenumber.PhoneNumber;

public class PhoneUtil {

	public static void validatePhoneNumberWithGoogleAPI(String[] phoneNumbers, String region)
			{
		
//		validate region
		Assert.isTrue(region.length() == 2, "Region must has exactly 2 characters");

		PhoneNumberUtil numberUtil = PhoneNumberUtil.getInstance();

		for (String number : phoneNumbers) {

			PhoneNumber phoneNumber;
			
			try {
				phoneNumber = numberUtil.parse(number, region.toUpperCase());
				Assert.isTrue(numberUtil.isValidNumber(phoneNumber), "Phone Number " + phoneNumber + " is invalid!");
				
			} catch (NumberParseException e) {
				e.printStackTrace();
			}
		}

	}

	public static void validatePhoneNumberWithGoogleAPI(String phone, String region)  {
		
//		validate region
		Assert.isTrue(region.length() == 2, "Region must has exactly 2 characters");
		
		Assert.isTrue(!phone.isEmpty(), "Phone can't be empty");

		PhoneNumberUtil numberUtil = PhoneNumberUtil.getInstance();

		PhoneNumber phoneNumber;
		
		try {
			phoneNumber = numberUtil.parse(phone, region.toUpperCase());
			Assert.isTrue(numberUtil.isValidNumber(phoneNumber), "Phone Number " + phoneNumber + " is invalid!");
			
		} catch (NumberParseException e) {
			e.printStackTrace();
		}

	}

	public static String getPhoneNumberWithRegionCode(String phone, String region) {
		
//		validate region
		Assert.isTrue(region.length() == 2, "Region must has exactly 2 characters");

//		validate phone number
		validatePhoneNumberWithGoogleAPI(phone, region);

//		Add region code
		switch (region.toUpperCase()) {

//		phone format 10-digits: xxxxxxxxxx
		case "US":
			phone = "+1" + phone;
			break;

		default:
			break;
		}

		return phone;
	}
}
