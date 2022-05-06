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
	private Storage profileUrl;
	private UserRole role;
	private String sub;

	@JsonIgnore
	private String password;

	private Collection<? extends GrantedAuthority> authorities;

	public UserDetailsImpl(Long id, String username, String password, String sub, Storage profileUrl, UserRole role,
			Collection<? extends GrantedAuthority> authorities) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.sub = sub;
		this.profileUrl = profileUrl;
		this.role = role;
		this.authorities = authorities;
	}

	public static UserDetailsImpl build(User user) {

// 		this list of GrantedAuthority would be used for PreAuthorize annotation
//		in this case, we add both Privileges and Roles into stream and concat together to authority
		List<GrantedAuthority> authorities = Stream
				.concat(user.getPrivileges().stream(), Stream.of("ROLE_" + user.getRole()))
				.map(role -> new SimpleGrantedAuthority(role.toString())).collect(Collectors.toList());

		return new UserDetailsImpl(user.getId(), user.getDisplayName(), user.getPassword(), user.getSub(),
				user.getProfileUrl(), user.getRole(), authorities);
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
		return true;
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
