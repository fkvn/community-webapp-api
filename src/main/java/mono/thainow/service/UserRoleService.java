package mono.thainow.service;

import java.util.Set;

import mono.thainow.domain.user.UserRole;

public interface UserRoleService {
	
	UserRole findByName(String roleName);
	
	UserRole verifyRoleByName(String roleName);
	
	Set<UserRole> verifyRoles(Set<String> roles);
}
