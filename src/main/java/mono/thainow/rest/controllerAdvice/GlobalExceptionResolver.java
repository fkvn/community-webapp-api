package mono.thainow.rest.controllerAdvice;

import mono.thainow.configuration.ApiError;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ExceptionHandlerExceptionResolver;

@Order(Ordered.HIGHEST_PRECEDENCE)
@ControllerAdvice
public class GlobalExceptionResolver extends ExceptionHandlerExceptionResolver {


    @ExceptionHandler(
            {MissingServletRequestParameterException.class, HttpMessageNotReadableException.class})
    protected ResponseEntity<Object> handleMissingServletRequestParameterException(Exception ex,
                                                                                   WebRequest request) {

        ex.printStackTrace();

        ApiError apiError = new ApiError();
        apiError.setPath(request.getDescription(true).split(";")[0].split("=")[1]);

        apiError.setStatus(HttpStatus.BAD_REQUEST);
        try {
            apiError.setError(ex.getCause().getLocalizedMessage());
            apiError.setMessage(ex.getCause().getLocalizedMessage());
        } catch (Exception e) {
            apiError.setError(ex.getLocalizedMessage());
            apiError.setMessage(ex.getLocalizedMessage());
        }

        return new ResponseEntity<Object>(apiError, new HttpHeaders(), apiError.getStatus());
    }

}
