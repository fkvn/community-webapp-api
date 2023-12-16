package mono.thainow.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.FORBIDDEN)
public class AccessForbidden extends RuntimeException {

    /**
     * d
     */
    private static final long serialVersionUID = 1L;

    public AccessForbidden() {
        super("Forbidden Access");
    }

    public AccessForbidden(String message) {
        super(message);

    }
}
