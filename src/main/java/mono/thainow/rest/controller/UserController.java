package mono.thainow.rest.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.service.UserService;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.view.View;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/users")
public class UserController {

	@Autowired
	private UserService userService;

	private void validateUserAccess(Long id) {
//		user binded the access_token
		UserDetailsImpl userDetails = (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

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
		User user = userService.getByUserId(id);
//		return user.getCompanies();
		return null;
	}

	@PostMapping("/{id}/profile")
	@ResponseStatus(HttpStatus.CREATED)
	public Storage uploadProfile(@PathVariable Long id, @RequestParam("file") MultipartFile file) {
		validateUserAccess(id);
		
		User user = userService.getByUserId(id);

//		Storage profile = userService.uploadProfilePicture(user, file);

//		return profile;
		return null;
	}


}
