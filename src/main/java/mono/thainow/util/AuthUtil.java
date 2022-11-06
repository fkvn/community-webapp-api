package mono.thainow.util;

import org.springframework.security.core.context.SecurityContextHolder;

import mono.thainow.domain.post.Post;
import mono.thainow.domain.profile.Profile;
import mono.thainow.domain.review.Review;
import mono.thainow.domain.user.UserRole;
import mono.thainow.exception.AccessForbidden;
import mono.thainow.service.impl.UserDetailsImpl;

public class AuthUtil {

	public static UserDetailsImpl getAuthenticatedUser() {

		if (SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")) {
			return null;
		}

		return (UserDetailsImpl) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	public static boolean authorizedAccess(Profile profile, boolean throwError) {

		UserDetailsImpl userDetails = getAuthenticatedUser();

		boolean adminAuthorized = userDetails != null
				&& (userDetails.getRole() != UserRole.ADMIN || userDetails.getRole() != UserRole.SUPERADMIN);


		boolean validRequester = userDetails != null && profile != null
				&& profile.getAccount().getId().equals(userDetails.getId());

		boolean authorizedAccess = adminAuthorized || validRequester;

		if (throwError && !authorizedAccess) {
			throw new AccessForbidden();
		}

		return authorizedAccess;
	}

	public static boolean isAdminAuthenticated() {
		UserDetailsImpl userDetails = getAuthenticatedUser();

		if (userDetails == null)
			return false;

		return userDetails.getRole() == UserRole.ADMIN || userDetails.getRole() == UserRole.SUPERADMIN;
	}

	public static boolean authorizedAccess(Profile postOwner, Post post, boolean throwError) {

		UserDetailsImpl userDetails = getAuthenticatedUser();

		boolean adminAuthorized = userDetails != null
				&& (userDetails.getRole() != UserRole.ADMIN || userDetails.getRole() != UserRole.SUPERADMIN);

		boolean validRequester = userDetails != null && postOwner != null
				&& postOwner.getAccount().getId().equals(userDetails.getId());

		boolean validPostOwner = validRequester && post != null && post.getOwner().getId().equals(userDetails.getId());

		boolean authorizedAccess = adminAuthorized || (validRequester && validPostOwner);

		if (throwError && !authorizedAccess) {
			throw new AccessForbidden();
		}

		return authorizedAccess;
	}

	public static boolean authorizedAccess(Profile reviewer, Review review, boolean throwError) {

		UserDetailsImpl userDetails = getAuthenticatedUser();

		boolean adminAuthorized = userDetails != null
				&& (userDetails.getRole() != UserRole.ADMIN || userDetails.getRole() != UserRole.SUPERADMIN);


		boolean validRequester = userDetails != null && review != null
				&& review.getReviewer().getId().equals(userDetails.getId());

		boolean validReviewer = validRequester && review != null
				&& review.getReviewer().getId().equals(reviewer.getId());

		boolean authorizedAccess = adminAuthorized || (validRequester && validReviewer);

		if (throwError && !authorizedAccess) {
			throw new AccessForbidden();
		}

		return authorizedAccess;
	}

}
