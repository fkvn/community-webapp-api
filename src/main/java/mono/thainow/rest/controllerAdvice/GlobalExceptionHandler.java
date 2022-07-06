package mono.thainow.rest.controllerAdvice;

import javax.persistence.EntityNotFoundException;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.InvalidDataAccessApiUsageException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.twilio.exception.ApiException;

import mono.thainow.util.ApiError;

@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler {

//	private JSONObject claims;
//
//	@ModelAttribute("claims")
//	protected JSONObject extractUserFromJWT(HttpServletRequest request) throws ParseException, AccessDeniedException {

//		System.out.println("checking");
//		Jwt jwt = new Jwt();
//		String sub = "";
//		claims = new JSONObject();
//		
//	
//		if (request.getHeader("Authorization") == null
//				|| request.getHeader("Authorization").length() == 0
//				|| request.getHeader("Authorization").equals("null")) {
//			return null;
//		}
//		
//		else {
//			System.out.println("authorization");
//			System.out.println(request.getHeader("Authorization"));
//			
//			String token = request.getHeader("Authorization").split(" ")[1]; // get jwt from header
//			JSONObject claimsObj = jwt.getClaimsObj(token);
//
//			sub = claimsObj.get("sub").toString();
//			
//			if (sub == null || sub.length() == 0)
//				throw new AccessDeniedException("Invalid Token");
//			
//			List<String> roles = (List<String>) Optional.ofNullable((claimsObj.get("role"))).orElse(new ArrayList<>());
//			User user = (User) Optional.ofNullable(jwt.getUserJwt(claimsObj)).orElse(new User());
//			
//			claims.put("sub", sub);
//			claims.put("roles", roles);
//			claims.put("admin", user);
//			claims.put("token", token);
//		}
//		
//		return claims;
//		return null;
//	}

	@ExceptionHandler({ IllegalArgumentException.class, InvalidDataAccessApiUsageException.class })
	protected ResponseEntity<Object> handleIllegalArgumentException(Exception ex, WebRequest request) {
		ex.printStackTrace();

		System.out.println("caught here!");

		ApiError apiError = new ApiError();
		apiError.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		try {
			apiError.setError(ex.getCause().getLocalizedMessage());
		} catch (Exception e) {
			apiError.setError(ex.getLocalizedMessage());
		}

		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
		apiError.setMessage(ex.getLocalizedMessage());

		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
	}

//	@ExceptionHandler({ DataIntegrityViolationException.class })
//	protected ResponseEntity<Object> handleDataIntegrityViolationException(Exception ex, WebRequest request) {
//
//		ex.printStackTrace();
//
//		String message = "Unexpected error! Please contact your administrator.";
//
//		if (ex.getCause() instanceof ConstraintViolationException) {
//			ConstraintViolationException cve = (ConstraintViolationException) ex.getCause();
//			String constraint = cve.getConstraintName();
//
//			switch (constraint) {
//			case "user.user_email_UNIQUE":
//				message = "The email has already existed or registered by another user.";
//				break;
//			case "user.user_phone_UNIQUE":
//				message = "The phone number has already existed or registered by another user.";
//				break;
//			case "user.user_username_UNIQUE":
//				message = "The username has already existed or registered by another user.";
//				break;
//			case "location.location_placeid_UNIQUE":
//				message = "Unexpected error! Please contact your administrator.";
//				break;
//			default:
//			}
//		}
//
//		ApiError apiError = new ApiError();
//		apiError.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
//		try {
//			apiError.setError(ex.getCause().getLocalizedMessage());
//		} catch (Exception e) {
//			apiError.setError(ex.getLocalizedMessage());
//		}
//
//		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
//		apiError.setMessage(message);
//
//		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
//	}

	@ExceptionHandler({ EmptyResultDataAccessException.class, EntityNotFoundException.class })
	protected ResponseEntity<Object> handleEmptyResultDataAccessException(Exception ex, WebRequest request) {
		ex.printStackTrace();

		ApiError apiError = new ApiError();
		apiError.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		try {
			apiError.setError(ex.getCause().getLocalizedMessage());
		} catch (Exception e) {
			apiError.setError(ex.getLocalizedMessage());
		}

		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
		apiError.setMessage("No records available! The record is either deleted or not exist.");

		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
	}

	@ExceptionHandler({ ApiException.class })
	protected ResponseEntity<Object> handleTwilioApiException(Exception ex, WebRequest request) {
		ex.printStackTrace();

		ApiError apiError = new ApiError();
		apiError.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		try {
			apiError.setError(ex.getCause().getLocalizedMessage());
		} catch (Exception e) {
			apiError.setError(ex.getLocalizedMessage());
		}

		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
		
		if (apiError.getError().indexOf("VerificationCheck was not found") > -1) {
			
			apiError.setMessage("Token Verification Failed. Please try again or request a new code!!!");
		} else {
			apiError.setMessage("Token Verification Process Error!!!");
		}

		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
	}

	@ExceptionHandler({ BadCredentialsException.class })
	protected ResponseEntity<Object> handleBadCredentialsException(Exception ex, WebRequest request) {
		ex.printStackTrace();

		ApiError apiError = new ApiError();
		apiError.setStatus(HttpStatus.UNAUTHORIZED);
		try {
			apiError.setError(ex.getCause().getLocalizedMessage());
		} catch (Exception e) {
			apiError.setError(ex.getLocalizedMessage());
		}

		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
		apiError.setMessage("Invalid Password!");

		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
	}

	@ExceptionHandler({ InternalAuthenticationServiceException.class })
	protected ResponseEntity<Object> handleInternalAuthenticationServiceException(Exception ex, WebRequest request) {
		ex.printStackTrace();

		ApiError apiError = new ApiError();
		apiError.setStatus(HttpStatus.UNAUTHORIZED);
		try {
			apiError.setError(ex.getCause().getLocalizedMessage());
		} catch (Exception e) {
			apiError.setError(ex.getLocalizedMessage());
		}

		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
		apiError.setMessage("User Not Found!");

		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
	}

	@ExceptionHandler({ AccessDeniedException.class })
	protected ResponseEntity<Object> handleAccessDeniedException(Exception ex, WebRequest request) {
		ex.printStackTrace();

		ApiError apiError = new ApiError();
		apiError.setStatus(HttpStatus.FORBIDDEN);
		try {
			apiError.setError(ex.getCause().getLocalizedMessage());
		} catch (Exception e) {
			apiError.setError(ex.getLocalizedMessage());
		}

		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
		apiError.setMessage("Access is denied!");

		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
	}

	@ExceptionHandler
	protected ResponseEntity<Object> handleExceptions(Exception ex, WebRequest request) {
		ex.printStackTrace();

		ApiError apiError = new ApiError();
		apiError.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
		try {
			apiError.setError(ex.getCause().getLocalizedMessage());
		} catch (Exception e) {
			apiError.setError(ex.getLocalizedMessage());
		}

		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
		apiError.setMessage("Unexpected error! Please contact your administrator.");

		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
	}

//	@ExceptionHandler({ TransactionSystemException.class, DataIntegrityViolationException.class })
//	protected ResponseEntity<Object> handleConstraintViolationExceptions(Exception ex,
//			WebRequest request) {
//
//		ex.printStackTrace();
//
//		ApiError apiError = new ApiError();
//		apiError.setStatus(HttpStatus.BAD_REQUEST);
//		apiError.setError(ex.getCause().getLocalizedMessage());
//		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
//
//		if (ex.getClass().equals(TransactionSystemException.class)) {
//
//			Throwable cause = ((TransactionSystemException) ex).getRootCause();
//			Set<ConstraintViolation<?>> constraintViolations = null;
//
//			if (cause instanceof ConstraintViolationException) {
//
//				constraintViolations = ((ConstraintViolationException) cause).getConstraintViolations();
//				String errorMessage = null;
//
//				for (Iterator<ConstraintViolation<?>> it = constraintViolations.iterator(); it.hasNext();) {
//					ConstraintViolation<?> cv = it.next();
//					errorMessage = cv.getMessage();
//				}
//
//				apiError.setMessage(errorMessage);
//
//			} else {
//
//				apiError.setMessage(ex.getMessage());
//			}
//		}
//
//		else if (ex.getClass().equals(DataIntegrityViolationException.class)) {
//			apiError
//					.setMessage(((DataIntegrityViolationException) ex).getRootCause().getLocalizedMessage());
//		}
//
//		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
//	}

//	@ExceptionHandler({ UserNotFoundException.class })
//	protected ResponseEntity<Object> hanlderCustomExceptions(Exception ex, WebRequest request) {
//
//		ex.printStackTrace();
//
//		ApiError apiError = new ApiError();
//
//		if (ex.getClass().equals(UserNotFoundException.class))
//			apiError.setStatus(HttpStatus.NOT_FOUND);
//
//		else
//			apiError.setStatus(HttpStatus.INTERNAL_SERVER_ERROR);
//
//		apiError.setError(ex.getClass().getSuperclass().getSimpleName());
//		apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);
//		apiError.setMessage(ex.getMessage());
//
//		return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
//	}

}
