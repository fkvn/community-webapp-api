package mono.thainow.rest.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.Getter;
import lombok.Setter;
import mono.thainow.domain.profile.UserProfile;
import mono.thainow.service.impl.UserDetailsImpl;
import mono.thainow.view.View;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@Getter
@Setter
@JsonView(View.Basic.class)
public class JwtResponse {

    private String access_token;
    private String type = "Bearer";

    @JsonIgnore
    private UserProfile userProfile = new UserProfile();

    @JsonIgnore
    private UserDetailsImpl userDetails = new UserDetailsImpl();

    public JwtResponse(String accessToken) {
        this.access_token = accessToken;
    }

    public JwtResponse(String accessToken, UserProfile profile) {
        this.access_token = accessToken;
        this.userProfile = profile;
    }

    public JwtResponse(String accessToken, UserProfile profile, UserDetailsImpl userDetails) {
        this.access_token = accessToken;
        this.userProfile = profile;
        this.userDetails = userDetails;
    }

    @SuppressWarnings("unused")
    public Map<String, Object> getAccount() {
        Map<String, Object> userInfo = new HashMap<>();

        userInfo.put("id", this.getUserDetails().getId());
        userInfo.put("authorities", getAuthorities());

        return userInfo;
    }

    private Collection<String> getAuthorities() {
        Collection<String> authorities =
                userDetails.getAuthorities().stream().map(authority -> authority.getAuthority())
                        .collect(Collectors.toList());
        return authorities;
    }

    public Map<String, Object> getProfile() {
        Map<String, Object> profileInfo = new HashMap<>();

        profileInfo.put("id", this.userProfile.getId());
        profileInfo.put("username", this.userDetails.getUsername());
        profileInfo.put("picture", this.getUserDetails().getPicture());
        profileInfo.put("type", this.userProfile.getType());
        profileInfo.put("status", this.userDetails.getStatus());


        return profileInfo;
    }

}
