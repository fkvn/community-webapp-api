package mono.thainow.service;

import mono.thainow.domain.company.Company;
import mono.thainow.domain.profile.BusinessProfile;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.domain.user.User;
import mono.thainow.rest.request.PatchProfileRequest;

import java.util.List;
import java.util.Optional;

public interface ProfileService {

    //	List<Profile> findAllProfilesByAccount(User account);

    //	List<Profile> findProfilesByAccount(User account);

    List<BusinessProfile> findBusinessProfilesByAccount(User account);

    UserProfile createUserProfile(User user);

    BusinessProfile createBusinessProfile(User user, Company company);

    void removeBusinessProfile(BusinessProfile companyProfile);

    void removeProfile(UserProfile profile, boolean removeAccount);

    //	UserProfile getValidUserProfile(Long profileId);

    UserProfile findUserProfileByAccount(User user);

    //	BusinessProfile findRegisteredBusinessProfileById(Long profileId);

    //	BusinessProfile findBusinessProfileById (Long profileId);

    BusinessProfile activateBusinessProfile(BusinessProfile profile);

    BusinessProfile disableBusinessProfile(BusinessProfile profile);

    UserProfile disableUserProfile(UserProfile profile);

    Profile findProfileById(Long profileId);

    Profile saveProfile(Profile profile);

    UserProfile activateUserProfile(UserProfile profile);

    //	BusinessProfile getValidCompanyProfile(Company com);

    List<Profile> findProfilesByAccountId(Long id);

    void blockPost(Long requesterId, Long postId);

    void unBlockPost(Long requesterId, Long postId);

    //	UserProfile findUserProfileById(Long profileId);

    Optional<Profile> findProfileByAccountId(Long id);

    void patchProfile(Profile profile, PatchProfileRequest request);

}
