package mono.thainow.util;

import java.util.Map;

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

}
