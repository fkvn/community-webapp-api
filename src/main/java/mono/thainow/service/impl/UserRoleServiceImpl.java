package mono.thainow.service.impl;

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
	public UserRole verifyRoleByName(String roleName) {
		
		UserRole result = null;
		
		result = findByName(roleName.trim());
		
		Assert.isTrue(result != null, "Role " + roleName + " is not found.");
		
		// TODO Auto-generated method stub
		return result;
	}

	@Override
	public Set<UserRole> verifyRoles(Set<String> roles) {
		// TODO Auto-generated method stub
		return null;
	}

}
