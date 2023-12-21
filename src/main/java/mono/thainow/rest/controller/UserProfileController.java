package mono.thainow.rest.controller;

import com.fasterxml.jackson.annotation.JsonView;
import mono.thainow.annotation.AdminAndSAdminAccess;
import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.repository.ProfileRepository;
import mono.thainow.rest.request.UserRequest;
import mono.thainow.service.AuthService;
import mono.thainow.service.ProfileService;
import mono.thainow.service.StorageService;
import mono.thainow.service.UserService;
import mono.thainow.view.View;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
//@PreAuthorize("hasAnyAuthority('USER_MANAGE')")
@RequestMapping("/api/profiles/users")
public class UserProfileController {

    @Autowired
    AuthService authService;
    @Autowired
    private ProfileService profileService;
    @Autowired
    private UserService userService;
    @Autowired
    private StorageService storageService;
    //    @Autowired
    //    private CompanyService companyService;

    @Autowired
    private ProfileRepository profileRepository;

    //	@GetMapping
    //	@ResponseStatus(HttpStatus.ACCEPTED)
    //	@JsonView(View.Detail.class)
    //	public UserProfile getUserProfile(@PathVariable Long profileId) {
    //
    //		UserProfile profile = (UserProfile) profileService.findProfileById(profileId);
    //
    //		if (!AuthUtil.isAdminAuthenticated()) {
    //			Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED, "Invalid
    //			Profile!");
    //		}
    //
    ////		anonymousUser -> public request
    //		if (AuthUtil.getAuthenticatedUser() == null) {
    //
    //			User user = profile.getAccount();
    //
    //			if (!user.isEmailPublic())
    //				user.setEmail(null);
    //			if (!user.isPhonePublic())
    //				user.setPhone(null);
    //			if (!user.isDescriptionPublic())
    //				user.setDescription(null);
    //			if (!user.isWebsitePublic())
    //				user.setWebsite(null);
    //
    //			profile.setAccount(user);
    //
    //		}
    //
    //		return profile;
    //	}


    //    @PostMapping("/{userId}")
    //    @ResponseStatus(HttpStatus.CREATED)
    //    @AdminAndSAdminAccess
    //    @JsonView(View.Basic.class)
    //    public Long createUserProfileByUserId(@PathVariable Long userId) {
    //		User user = userService.findUserById(userId);
    //
    //        Assert.isTrue(user.getStatus() == UserStatus.DELETED, "The account has existed!");
    //
    //        user = userService.activateUser(user);
    //
    //        Profile userProfile = profileService.createUserProfile(user);
    //
    //        return userProfile.getId();
    //    }

    @GetMapping("/byUserId")
    @JsonView(View.Basic.class)
    @ResponseStatus(HttpStatus.ACCEPTED)
    public Profile findUserProfileByUser(@RequestParam Long id) {
        User user = userService.findActiveUserById(id).get();
        return profileRepository.findProfileByAccount(user).get();
    }

    @PatchMapping("/{profileId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @JsonView(View.Basic.class)
    @AuthenticatedAccess
    public void updateUserProfile(@PathVariable Long profileId,
                                  @Valid @RequestBody UserRequest request) throws AccessForbidden {

        UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

        if (!authService.isAdminAuthenticated()) {
            Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED,
                    "Invalid Profile!");
        }

        authService.getAuthorizedProfile(profile, true);

        //		update user
        User account = profile.getAccount();
        account = userService.fetchUserFromUserRequest(account, request);
        account = userService.saveUser(account);
    }

    @DeleteMapping("/{profileId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AuthenticatedAccess
    public void removeUserProfile(@PathVariable Long profileId,
                                  @RequestParam(defaultValue = "true") boolean removeAccount)
            throws AccessForbidden {

        UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

        if (!authService.isAdminAuthenticated()) {
            Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED,
                    "Invalid Profile!");
        }

        authService.getAuthorizedProfile(profile, true);

        profileService.removeProfile(profile, removeAccount);

    }

    @PatchMapping("/{profileId}/activate")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AdminAndSAdminAccess
    public void activateUserProfile(@PathVariable Long profileId) {

        UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

        profileService.activateUserProfile(profile);
    }

    @PatchMapping("/{profileId}/disable")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @AdminAndSAdminAccess
    public void disableUserProfile(@PathVariable Long profileId) {

        UserProfile profile = (UserProfile) profileService.findProfileById(profileId);

        profileService.disableUserProfile(profile);

    }


    //    @PostMapping("/{profileId}/business/{companyId}")
    //    @ResponseStatus(HttpStatus.CREATED)
    //    @AdminAndSAdminAccess
    //    @JsonView(View.Basic.class)
    //    public void addBusinessProfileByCompany(@PathVariable Long profileId, @PathVariable
    //    Long companyId) {
    //
    //        Company company = companyService.findCompanyById(companyId);
    //
    //        Assert.isTrue(company.getStatus() == CompanyStatus.REJECTED, "This business is
    //        existed!");
    //
    //        company = companyService.activateCompany(company);
    //
    //        User account = profileService.findProfileById(profileId).getAccount();
    //
    //        try {
    //            profileService.createBusinessProfile(account, company);
    //
    //            if (account.getRole() == UserRole.CLASSIC) {
    //                account.setRole(UserRole.BUSINESS);
    //                account = userService.saveUser(account);
    //            }
    //
    //        } catch (Exception e) {
    //            companyService.remove(company);
    //            throw e;
    //        }
    //
    //    }

}
