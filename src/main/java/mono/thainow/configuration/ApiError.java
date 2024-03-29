package mono.thainow.configuration;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.http.HttpStatus;

import java.util.Date;

@Getter
@Setter
public class ApiError {

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date timestamp;

    private HttpStatus status;

    private String error;

    private String message;

    private String path;

    public ApiError(HttpStatus status, String error, String message, String path) {

        super();
        this.timestamp = new Date();
        this.status = status;
        this.error = error;
        this.message = message;
        this.path = path;
    }

    public ApiError() {

        super();
        this.timestamp = new Date();
    }


}
