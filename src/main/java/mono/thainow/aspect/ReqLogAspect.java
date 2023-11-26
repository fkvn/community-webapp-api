//package mono.thainow.aspect;
//
//import com.google.common.io.CharStreams;
//import lombok.extern.slf4j.Slf4j;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.web.context.request.RequestContextHolder;
//import org.springframework.web.context.request.ServletRequestAttributes;
//import org.springframework.web.util.ContentCachingRequestWrapper;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.Date;
//
//@Aspect
//@Configuration
//@Slf4j
//public class ReqLogAspect {
//
//    @Around("execution(@(@org.springframework.web.bind.annotation.RequestMapping *) * *(..)) || @annotation(org.springframework.web.bind.annotation.RequestMapping) && execution(* *(..))")
//    public Object log(final ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
//
//        HttpServletRequest request =
//                ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
//
//        Object value;
//
//        try {
//            value = proceedingJoinPoint.proceed();
//        } catch (Throwable throwable) {
//            throw throwable;
//        } finally {
////			caching request
//            ContentCachingRequestWrapper req = new ContentCachingRequestWrapper(request);
//            String requestBody = CharStreams.toString(request.getReader());
//
//            log.info("{} {} {} {} {} {}",
//                    new Date(),
//                    request.getHeader("Authorization"),
//                    request.getMethod(),
//                    request.getRequestURI(),
//                    request.getQueryString(),
//                    requestBody
//            );
//        }
//        return value;
//    }
//}
