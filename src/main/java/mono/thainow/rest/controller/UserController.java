package mono.thainow.rest.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.domain.user.User;
import mono.thainow.service.UserService;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/users")
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<User> getAllUsers() {
		return userService.getAllUsers();
	} 
	
	@GetMapping("/{id}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public User getUser(@PathVariable Long id) {
		return userService.getByUserId(id);
	} 

	@GetMapping("/page/{pageNo}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Map<String, Object> getUserPaginated(@PathVariable Long pageNo, @RequestBody Map<String, Object> pageInfo) {
		return null;
	}

	@PatchMapping("/{id}")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public Long updatePartialUser(@PathVariable Long id, @RequestBody Map<String, Object> userInfo) {
		return userService.updatePartialUser(id, userInfo);
	}

	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void deleteUser(@PathVariable Long id) {
		userService.deleteUser(id);
	}
	
	@DeleteMapping("/remove/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void removeUser(@PathVariable Long id) {
		userService.removeUser(id);
	}

}
