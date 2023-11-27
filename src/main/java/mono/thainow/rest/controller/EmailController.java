package mono.thainow.rest.controller;

import mono.thainow.rest.request.EmailRequest;
import mono.thainow.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/emails")
public class EmailController {

    @Autowired
    private EmailService emailService;

    // Sending a simple Email
    @PostMapping
    public boolean sendMail(@Valid @RequestBody EmailRequest request) {
        return emailService.sendSimpleMail(emailService.fetchEmailFromRequest(request));
    }

    @GetMapping("/exist")
    @ResponseStatus(HttpStatus.ACCEPTED)
    public Boolean isEmailExisting(@RequestParam String email) {
        Boolean isEmailExisting = emailService.isEmailExisting(email);
        return isEmailExisting;
    }

}
