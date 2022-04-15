package mono.thainow.service.impl;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.domain.user.UserPrivilege;
import mono.thainow.service.UserPrivilegeService;

@Service
public class UserPrivilegeServiceImpl implements UserPrivilegeService {

	@Override
	public UserPrivilege findByName(String privilegeName) {
		UserPrivilege result = null;
	    
	    for (UserPrivilege privilege : UserPrivilege.values()) {
	        if (privilege.name().equalsIgnoreCase(privilegeName)) {
	        	result = privilege;
	            break;
	        }
	    }
	    
	    return result;
	}

	@Override
	public Set<UserPrivilege> verifyPrivileges(Set<String> strPrivileges) {
		
		Assert.isTrue(!strPrivileges.isEmpty(), "Role can't be empty");
		
		Set<UserPrivilege> privileges = new HashSet<>();

		for (String privilege : strPrivileges) {

			Optional<UserPrivilege> userPrivilege = Optional.ofNullable(findByName(privilege.trim()));

			Assert.isTrue(!userPrivilege.isEmpty(), "Role " + privilege + " is not found.");

			privileges.add(userPrivilege.get());
		}
		
		return privileges;
	}
}
