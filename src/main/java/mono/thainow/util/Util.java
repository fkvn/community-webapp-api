package mono.thainow.util;

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

}
