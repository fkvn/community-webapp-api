package mono.thainow.service;

import java.util.Set;

import mono.thainow.domain.user.UserPrivilege;

public interface UserPrivilegeService {
	
	UserPrivilege findByName(String privilege);
	
	Set<UserPrivilege> verifyPrivileges(Set<String> privileges);
}
