package mono.thainow.service.impl;

import org.springframework.stereotype.Service;

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

}
