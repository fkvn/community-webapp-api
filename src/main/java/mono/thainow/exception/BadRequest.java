package mono.thainow.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.BAD_REQUEST)
public class BadRequest extends RuntimeException {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	public BadRequest(String message) {

		super(getMessage(message));

	}

	public static String getMessage(String message) {
		if (message.isEmpty()) {
			message = "Bad Request";
		}
		return message;
	}
}
