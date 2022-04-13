package mono.thainow.util;

import org.springframework.util.Assert;

public class PasswordUtil {
	
	public static void verifyPassword(String password) {
		
		String passwordRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?!.* ).{8,20}$";
		
		Assert.isTrue(password.matches(passwordRegex),
				"Your password must be between 8 and 20 characters (at least 1 upper, 1 lower, 1 number, and no white space)");
	}
}
