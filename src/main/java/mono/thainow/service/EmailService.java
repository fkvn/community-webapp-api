package mono.thainow.service;

import mono.thainow.domain.email.EmailDetails;
import mono.thainow.rest.request.EmailRequest;

import javax.validation.Valid;

public interface EmailService {

    Boolean isEmailExisting(String email);

    Boolean isEmailValid(String email);

    // To send a simple email
    boolean sendSimpleMail(EmailDetails details);

    EmailDetails fetchEmailFromRquest(@Valid EmailRequest request);


}
