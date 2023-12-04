package mono.thainow.rest.controller;

import com.fasterxml.jackson.annotation.JsonView;
import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
import mono.thainow.domain.profile.BusinessProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.ProfileType;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.repository.ProfileRepository;
import mono.thainow.rest.request.ModifyProfileRequest;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.*;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.view.View;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/profiles")
public class ProfileController {

    @Autowired
    private ProfileService profileService;

    @Autowired
    private UserService userService;

    @Autowired
    private StorageService storageService;


    @Autowired
    private CompanyService companyService;

    @Autowired
    private AuthService authService;

    @Autowired
    private ProfileRepository profileRepository;

    @GetMapping
    @ResponseStatus(HttpStatus.ACCEPTED)
    @AuthenticatedAccess
    @JsonView(View.Basic.class)
    public List<Profile> getProfiles() {
        return profileService.findProfilesByAccountId(authService.getAuthenticatedUser().getId());
    }

    @GetMapping("/{profileId}")
    @ResponseStatus(HttpStatus.ACCEPTED)
    @JsonView(View.Detail.class)
    public Profile findProfile(@PathVariable Long profileId) {

        Profile profile = profileService.findProfileById(profileId);

        //		anonymousUser -> public request
        if (authService.getAuthenticatedUser() == null) {

            if (profile.getType() == ProfileType.USER_PROFILE) {

                User user = profile.getAccount();

                if (!user.isEmailPublic()) user.setEmail(null);
                if (!user.isPhonePublic()) user.setPhone(null);
                if (!user.isDescriptionPublic()) user.setDescription(null);
                if (!user.isWebsitePublic()) user.setWebsite(null);

                profile.setAccount(user);

            } else if (profile.getType() == ProfileType.BUSINESS_PROFILE) {
                Company company = ((BusinessProfile) profile).getCompany();

                if (!company.isEmailPublic()) company.setEmail(null);
                if (!company.isPhonePublic()) company.setPhone(null);
                if (!company.isDescriptionPublic()) company.setDescription(null);
                if (!company.isWebsitePublic()) company.setWebsite(null);
                if (!company.isSizePublic()) company.setSize(null);

                ((BusinessProfile) profile).setCompany(company);
            }
        }

        //		authorized request
        else if (!authService.isAdminAuthenticated()) {
            if (profile.getType() == ProfileType.USER_PROFILE) {
                Assert.isTrue(profile.getAccount().getStatus() == UserStatus.ACTIVATED,
                        "Invalid Profile!");
            } else if (profile.getType() == ProfileType.BUSINESS_PROFILE) {
                Assert.isTrue(((BusinessProfile) profile).getCompany().getStatus() ==
                        CompanyStatus.REGISTERED, "Profile is NOT registered!");
            }
        }

        return profile;

    }

    @PostMapping("/{id}/picture")
    @ResponseStatus(HttpStatus.CREATED)
    @AuthenticatedAccess
    public Storage uploadProfilePicture(@PathVariable Long id,
                                        @Valid @RequestBody StorageRequest newPicture) {


        UserProfile profile = (UserProfile) validateModifyProfileRequest(id);

        //		get storage
        Storage picture = storageService.fetchStorageFromRequest(newPicture);
        picture = storageService.saveStorage(picture);

        if (profile.getType() == ProfileType.USER_PROFILE) {
            //			update account picture
            User account = profile.getAccount();
            account.setPicture(picture);
            userService.saveUser(account);

        }
        //        else if (profile.getType() == ProfileType.BUSINESS_PROFILE) {
        //////			update company logo
        ////            Company company = ((BusinessProfile) profile).getCompany();
        ////            company.setLogo(picture);
        ////            company = companyService.saveCompany(company);
        //        }

        return picture;
    }

    // Helper Method
    private Profile validateModifyProfileRequest(Long profileId) {
        UserDetailsImpl requester = authService.getAuthenticatedUser();
        UserProfile profile = (UserProfile) profileRepository.findById(profileId).get();

        if (!requester.isAdmin() && requester.getId() != profile.getAccount().getId()) {
            throw new AccessForbidden();
        }

        return profile;
    }

    @PatchMapping("/{id}")
    @ResponseStatus(HttpStatus.CREATED)
    @AuthenticatedAccess
    public void updateProfile(@PathVariable Long id,
                              @Valid @RequestBody ModifyProfileRequest request) {
        UserProfile profile = (UserProfile) validateModifyProfileRequest(id);
        profileService.modifyProfile(profile, request);
    }

    @PostMapping("/{requesterId}/block/posts/{postId}")
    @AuthenticatedAccess
    public void blockPost(@PathVariable Long requesterId, @PathVariable Long postId) {
        profileService.blockPost(requesterId, postId);
    }

    @PostMapping("/{requesterId}/unblock/posts/{postId}")
    @AuthenticatedAccess
    public void unBlockPost(@PathVariable Long requesterId, @PathVariable Long postId) {
        profileService.unBlockPost(requesterId, postId);
    }

}
