package mono.thainow.service.impl;

import java.util.Collection;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.domain.storage.Storage;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserRole;
import mono.thainow.domain.user.UserStatus;

/*
 * contains necessary information (such as: username, password, authorities) to
 * build an Authentication object.
 */
@RequiredArgsConstructor
@Getter
@Setter
public class UserDetailsImpl implements UserDetails {

	private static final long serialVersionUID = 1L;
	private Long id;
	private String username;
	private String email;
	private Storage profileUrl;
	private UserRole role;
	private UserStatus status;
	private String sub;

	

	@JsonIgnore
	private String password;

	private Collection<? extends GrantedAuthority> authorities;

	public UserDetailsImpl(User user,  Collection<? extends GrantedAuthority> authorities) {
		this.id = user.getId();
		this.username = user.getUsername();
		this.password = user.getPassword();
		this.sub = user.getSub();
		this.email = user.getEmail();
//		this.profileUrl = user.getProfileUrl();
		this.role = user.getRole();
		this.status = user.getStatus();
		this.authorities = authorities;

	}

	public static UserDetailsImpl build(User user) {

//		List<Company> companies = new ArrayList<>();
//
//		if (user.getRole() == UserRole.BUSINESS) {
//			companies = user.getCompanies();
//		}

// 		this list of GrantedAuthority would be used for PreAuthorize annotation
//		in this case, we add both Privileges and Roles into stream and concat together to authority
		List<GrantedAuthority> authorities = Stream
				.concat(user.getPrivileges().stream(), Stream.of("ROLE_" + user.getRole()))
				.map(role -> new SimpleGrantedAuthority(role.toString())).collect(Collectors.toList());

		return new UserDetailsImpl(user, authorities);
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return this.getStatus() == UserStatus.ACTIVATED;
	}
	


	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		UserDetailsImpl user = (UserDetailsImpl) o;
		return Objects.equals(id, user.id);
	}
}
