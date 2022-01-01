package mono.thainow.rest.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.domain.user.User;
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
	// public Long createUser(@ModelAttribute("sub") String sub, @RequestBody Survey
	// survey)
	public Long createUser(@RequestBody User user) {
		return userService.createUser(user);
	}

}
