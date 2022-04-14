package mono.thainow.security.jwt;

import java.util.ArrayList;
import java.util.Optional;
import java.util.Set;

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;

public class Jwt {

	
	public JSONObject getClaimsObj(String token) {
		
		JSONObject claimsObj = null;
		
		
		String encodedPayload = token.split("\\.")[1]; // get second encoded part in jwt
		Base64 base64Url = new Base64(true);
		String payload = new String(base64Url.decode(encodedPayload));

		JSONParser parser = new JSONParser();
		
		try {
			claimsObj = (JSONObject) parser.parse(payload);
		} catch (org.json.simple.parser.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return claimsObj;
	}
	
	@SuppressWarnings("unchecked")
	public User getUserJwt(JSONObject claimsObj) {

//		define fields
		String sub = Optional.ofNullable(claimsObj.get("sub").toString()).orElse("");
		
		Set<UserRole> roles = (Set<UserRole>) Optional.ofNullable((claimsObj.get("role"))).orElse(new ArrayList<>());
		
		String email = Optional.ofNullable(claimsObj.get("email").toString()).orElse("");
		
		boolean isEmailVerified = (boolean) Optional.ofNullable(claimsObj.get("email_verified")).orElse(false);
		
		String firstName = Optional.ofNullable(claimsObj.get("given_name").toString()).orElse("");
		String lastName = Optional.ofNullable(claimsObj.get("family_name").toString()).orElse("");
		String fullName = Optional.ofNullable(claimsObj.get("name").toString()).orElse("");
		String username = Optional.ofNullable(claimsObj.get("preferred_username").toString()).orElse("");
		
		UserStatus status = (UserStatus) Optional.ofNullable(claimsObj.get("status")).orElse(UserStatus.DEACTIVED);

//		create user
		User user = new User();

//		update user
		user.setSub(sub);
//		user.setRoles(roles);
		user.setEmail(email);
		user.setEmailVerified(isEmailVerified);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setFullName(fullName);
		user.setUsername(username);
		user.setStatus(status);
		

//		return user
		return user;
	}

	
}
