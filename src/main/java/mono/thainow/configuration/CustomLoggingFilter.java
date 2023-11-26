package mono.thainow.configuration;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.AbstractRequestLoggingFilter;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Component
@Slf4j
public class CustomLoggingFilter extends AbstractRequestLoggingFilter {

//    @Value("${request.logging.shouldLog}")
//    private boolean shouldLog;

    public CustomLoggingFilter() {
        setIncludeClientInfo(true);
        setIncludeHeaders(true);
        setIncludePayload(true);
        setIncludeQueryString(true);
        setAfterMessagePrefix(new Date() + " ");
    }

    @Override
    protected boolean shouldLog(HttpServletRequest request) {
        return true;
    }

    @Override
    protected void beforeRequest(HttpServletRequest request, String message) {
//        log.info(message);
    }

    @Override
    protected void afterRequest(HttpServletRequest request, String message) {
        if (request.getServletPath().contains("auth")) {
            log.info("date={} method={} uri={} query={}",
                    new Date(),
                    request.getMethod(),
                    request.getRequestURI(),
                    request.getQueryString());

        } else
            log.info(message);
    }
}