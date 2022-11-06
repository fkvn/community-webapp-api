package mono.thainow.rest.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import mono.thainow.rest.request.EmailRequest;
import mono.thainow.service.EmailService;

@RestController
@RequestMapping("/api/emails")
public class EmailController {

	@Autowired
	private EmailService emailService;

	// Sending a simple Email
	@PostMapping
	public boolean sendMail(@Valid @RequestBody EmailRequest request) {
		return emailService.sendSimpleMail(emailService.fetchEmailFromRquest(request));
	}

}
