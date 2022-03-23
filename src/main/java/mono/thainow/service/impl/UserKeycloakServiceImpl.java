//package mono.thainow.service.impl;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.transaction.Transactional;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Qualifier;
//import org.springframework.data.domain.Page;
//import org.springframework.stereotype.Service;
//import org.springframework.web.client.RestTemplate;
//
//import mono.thainow.domain.user.User;
//import mono.thainow.service.UserService;
//
//@Service
////@Primary
//@Qualifier
//public class UserKeycloakServiceImpl implements UserService {
//
//	final String server = "http://localhost:8080";
//	final String realm = "thainow-mono";
//	final String restUri = server + "/auth/admin/realms" + realm + "/";
//	
//	@Autowired
//	private UserServiceDashboardImpl userInternalService;
//	
//	
//	@Override
//	public List<User> getAllUsers() {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
//
//	@Override
//	public String getAllUsers(String token) {
//		
//		String api = "users";
//		
//		 RestTemplate restTemplate = new RestTemplate();
//		 String result = restTemplate.getForObject(restUri + api, String.class);
//		
//		return result;
//	}
//
//	@Override
//	public User getUserById(Long id) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Page<User> findUserPaginated(int pageNo, int pageSize) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public User findByUsername(String username) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
//	@Override
//	public User saveUser(User user) {
//
//		return null;
//	}
//	
//	@Override
//	@Transactional
//	public Long createUser(String token, User user, User admin) {
//		// TODO Auto-generated method stub
//		userInternalService.createUser(token, user, admin);
//		System.out.println("Keycloak add user");
//		return null;
//	}
//
//
//	@Override
//	public Long updatePartialUser(Long id, Map<String, Object> userInfo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void removeUser(Long id) {
//		// TODO Auto-generated method stub
//
//	}
//
//
//	@Override
//	public User findByUserEmail(String email) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//
//	@Override
//	public User findByUserPhone(String phone) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//
//	@Override
//	public User findByUserSub(String sub) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//
//
//
//
//
//
//}
