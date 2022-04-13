package mono.thainow.service.impl;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.domain.user.UserRole;
import mono.thainow.service.UserRoleService;

@Service
public class UserRoleServiceImpl implements UserRoleService {

	@Override
	public UserRole findByName(String roleName) {
	    UserRole result = null;
	    
	    for (UserRole role : UserRole.values()) {
	        if (role.name().equalsIgnoreCase(roleName)) {
	        	result = role;
	            break;
	        }
	    }
	    
	    return result;
	}

	@Override
	public Set<UserRole> verifyRoles(Set<String> strRoles) {
		
		Assert.isTrue(!strRoles.isEmpty(), "Role can't be empty");
		
		Set<UserRole> roles = new HashSet<>();

		for (String role : strRoles) {

			Optional<UserRole> userRole = Optional.ofNullable(findByName(role.trim()));

			Assert.isTrue(!userRole.isEmpty(), "Role " + role + " is not found.");

			roles.add(userRole.get());
		}
		
		return roles;
	}
}
