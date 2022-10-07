package mono.thainow.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.annotation.AdminAndSAdminAccess;
import mono.thainow.service.UserService;

@RestController
@RequestMapping("/api/users")
public class UserController {

	@Autowired
	private UserService userService;

	@PatchMapping("/{userId}/activate")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	@AdminAndSAdminAccess
	public void activateUser(@PathVariable Long userId) {
		userService.activateUserById(userId);
	}

}
