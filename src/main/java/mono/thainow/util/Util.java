package mono.thainow.util;

import java.util.Map;

import org.apache.commons.validator.routines.EmailValidator;
import org.apache.commons.validator.routines.UrlValidator;
import org.springframework.util.Assert;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Util {


	public static Integer getIntegerNumeric(String strNum) {
		if (strNum == null) {
			return null;
		}

		try {
			Integer d = Integer.valueOf(strNum);
			return d;

		} catch (NumberFormatException nfe) {
			return null;
		}
	}

	public static Map<String, Object> objectToMap(Object obj) {

		ObjectMapper oMapper = new ObjectMapper();

		@SuppressWarnings("unchecked")
		Map<String, Object> map = oMapper.convertValue(obj, Map.class);

		return map;
	}

	public static boolean isValidUrl(String url) {
		
		Assert.isTrue(!url.isEmpty(), "Invalid Website Address");
		
		String[] schemes = {"http","https"};
		UrlValidator urlValidator = new UrlValidator(schemes);
		return urlValidator.isValid(url);
	}
	
	public static boolean isValidEmail(String email) {
		return EmailValidator.getInstance().isValid(email);
	}

}
