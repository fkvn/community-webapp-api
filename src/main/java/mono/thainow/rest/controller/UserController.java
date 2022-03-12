package mono.thainow.rest.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.service.UserService;

@RestController
@RequestMapping("/api/users")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<User> getAllUsers() {
		return userService.getAllUsers();
	}

	@GetMapping("/page/{pageNo}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Map<String, Object> getUserPaginated(@PathVariable Long pageNo, @RequestBody Map<String, Object> pageInfo) {
		return null;
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public Long createUser(@ModelAttribute("claims") JSONObject claims, @RequestBody User user) {
		
		@SuppressWarnings({ "unchecked" })
		boolean isSuperAdmin = (boolean) (((ArrayList<String>) claims.get("roles")).contains(UserRole.SUPERADMIN.toString()));
		Assert.isTrue(isSuperAdmin, "Access Forbidden");
		
		User admin = (User) claims.get("admin");
		
//		return null;
//		return userService.createUser(user);
		return userService.createUser(claims.get("token").toString(), user, admin);
	}

	@PatchMapping("/{id}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Long updatePartialUser(@PathVariable Long id, @RequestBody Map<String, Object> userInfo) {
		return userService.updatePartialUser(id, userInfo);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
//	public void deleteSurvey(@ModelAttribute("sub") String sub, @PathVariable Long id) 
	public void deleteSurvey(@PathVariable Long id) {
		userService.removeUser(id);
	}

}
