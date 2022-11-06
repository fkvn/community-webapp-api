package mono.thainow.service.impl;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import mono.thainow.dao.EmailDao;
import mono.thainow.domain.email.EmailDetails;
import mono.thainow.rest.request.EmailRequest;
import mono.thainow.service.EmailService;
import mono.thainow.util.Util;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Value("${spring.mail.username}")
	private String sender;

	@Autowired
	private EmailDao emailDao;

	private final String CO_RECIPIENT = "kvngo@tedkvn.com";

	@Override
	public boolean sendSimpleMail(EmailDetails details) {
		try {

			// Creating a simple mail message
			SimpleMailMessage mailMessage = new SimpleMailMessage();

			// Setting up necessary details
			mailMessage.setFrom(sender);
			mailMessage.setTo(CO_RECIPIENT);
			mailMessage.setSubject(details.getSubject());
			mailMessage.setText(details.getMsgBody());
		
			// Sending the mail
			javaMailSender.send(mailMessage);

			emailDao.saveEmail(details);

			return true;
		}

		// Catch block to handle the exceptions
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public EmailDetails fetchEmailFromRquest(@Valid EmailRequest request) {

		String email = Optional.ofNullable(request.getRecipient()).orElse("").trim();

		Assert.isTrue(!email.isBlank(), "Email can't be blank!");
		Assert.isTrue(Util.isValidEmail(email), "Invalid Email");

		EmailDetails emailDetails = new EmailDetails();

		String subject = Optional.ofNullable(request.getSubject()).orElse("ThaiNow Report").trim();
		String msgBody = Optional.ofNullable(request.getMsgBody()).orElse("").trim();

		emailDetails.setSubject(subject);
		emailDetails.setRecipient(email);
		emailDetails.setMsgBody(msgBody);

		return emailDetails;
	}

}
