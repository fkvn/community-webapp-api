package mono.thainow.service;

import javax.validation.Valid;

import mono.thainow.domain.email.EmailDetails;
import mono.thainow.rest.request.EmailRequest;

public interface EmailService {

	 // Method
    // To send a simple email
    boolean sendSimpleMail(EmailDetails details);

	EmailDetails fetchEmailFromRquest(@Valid EmailRequest request);
 
//    // Method
//    // To send an email with attachment
//    String sendMailWithAttachment(EmailDetails details);
}
