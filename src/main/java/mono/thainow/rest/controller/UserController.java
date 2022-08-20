package mono.thainow.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.annotation.InternalAuthorization;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.user.User;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.service.UserService;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.view.View;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/admin/users")
@InternalAuthorization
public class UserController {

	@Autowired
	private UserService userService;

//	user binded the access_token
	private UserDetailsImpl getAuthorizedUser() {
		return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	private void validateUserAccess(Long id) {

		UserDetailsImpl userDetails = getAuthorizedUser();

		if (!id.equals(userDetails.getId())) {
			throw new AccessForbidden();
		}
	}

	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<User> getAllUsers() {
		return userService.getAllUsers();
	}

	@GetMapping("/{id}")
	@JsonView(View.UserView.Private.class)
	@ResponseStatus(HttpStatus.ACCEPTED)
	public User getUser(@PathVariable Long id) {
		validateUserAccess(id);
		return userService.getByUserId(id);
	}

	
	@GetMapping("/{id}/companies")
	@ResponseStatus(HttpStatus.ACCEPTED)
	public List<Company> getCompanies(@PathVariable Long id) {
		validateUserAccess(id);
//		User user = userService.getByUserId(id);
//		return user.getCompanies();
		return null;
	}

}
