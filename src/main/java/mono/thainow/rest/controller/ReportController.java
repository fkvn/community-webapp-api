package mono.thainow.rest.controller;

import mono.thainow.domain.email.EmailDetails;
import mono.thainow.rest.request.EmailRequest;
import mono.thainow.rest.request.ReportRequest;
import mono.thainow.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/reports")
public class ReportController {

    @Autowired
    private EmailService emailService;

    @PostMapping
    public boolean sendReport(@Valid @RequestBody ReportRequest request) {

        Assert.isTrue(request.getType().equals("USER_REPORT") || request.getType().equals("SERVICE_REPORT"),
                "Invalid Report Type");

        Assert.isTrue(request.getTypeId() != null, "Invalid Type Id");

        EmailRequest emailRequest = new EmailRequest();

        emailRequest.setRecipient(request.getSender());
        emailRequest.setSubject(request.getSubject());

        String emailBody = "Sender: " + request.getSender() + "\r\n\r\n" + "Report Type: " + request.getType()
                + "\r\n\r\n" + "Report Type Id: " + request.getTypeId() + "\r\n\r\n" + "Message: "
                + request.getMessage() + "\r\n\r\n" + "Reasons: " + request.getReasons().toString();

        emailRequest.setMsgBody(emailBody);

        EmailDetails emailDetails = emailService.fetchEmailFromRequest(emailRequest);

        return emailService.sendSimpleMail(emailDetails);
    }

}
