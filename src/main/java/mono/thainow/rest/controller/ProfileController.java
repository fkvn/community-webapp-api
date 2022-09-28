package mono.thainow.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.profile.Profile;
import mono.thainow.service.ProfileService;
import mono.thainow.util.AuthUtil;
import mono.thainow.view.View;

@RestController
@RequestMapping("/api/profiles")
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	@GetMapping
	@ResponseStatus(HttpStatus.ACCEPTED)
	@AuthenticatedAccess
	@JsonView(View.Basic.class)
	public List<Profile> getProfiles() {
		return profileService.findProfilesByAccountId(AuthUtil.getAuthenticatedUser().getId());
	}

}
