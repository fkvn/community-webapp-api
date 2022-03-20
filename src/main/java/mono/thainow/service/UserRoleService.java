package mono.thainow.service;

import mono.thainow.domain.user.UserRole;

public interface UserRoleService {
	UserRole findByName(String role);
}
