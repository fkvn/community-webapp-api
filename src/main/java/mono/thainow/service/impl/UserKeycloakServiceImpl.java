package mono.thainow.service.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import mono.thainow.domain.user.User;
import mono.thainow.repository.UserRepository;
import mono.thainow.service.UserService;

@Service
@Primary
//@Qualifier
public class UserKeycloakServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserInternalServiceImpl userInternalService;
	
	
	@Override
	public List<User> getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User getUserById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<User> findUserPaginated(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Long createUser(User user) {

		return null;
	}
	
	@Override
	@Transactional
	public Long createUser(String token, User user, User admin) {
		// TODO Auto-generated method stub
		userInternalService.createUser(token, user, admin);
		System.out.println("Keycloak add user");
		return null;
	}


	@Override
	public Long updatePartialUser(Long id, Map<String, Object> userInfo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeUser(Long id) {
		// TODO Auto-generated method stub

	}



}
