package mono.thainow.service.impl;

import mono.thainow.dao.EmailDao;
import mono.thainow.domain.email.EmailDetails;
import mono.thainow.domain.user.User;
import mono.thainow.domain.user.UserStatus;
import mono.thainow.repository.UserRepository;
import mono.thainow.rest.request.EmailRequest;
import mono.thainow.service.EmailService;
import org.apache.commons.validator.routines.EmailValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import javax.validation.Valid;
import java.util.Optional;

@Service
public class EmailServiceImpl implements EmailService {

    private final String CO_RECIPIENT = "kvngo@tedkvn.com";
    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private UserRepository userRepository;
    @Value("${spring.mail.username}")
    private String sender;
    @Autowired
    private EmailDao emailDao;

    //	=============================================================

    @Override
    public Boolean isEmailValid(String email) {
        return EmailValidator.getInstance().isValid(email);
    }

    @Override
    public Boolean isEmailExisting(String email) {
        Assert.isTrue(isEmailValid(email), "Invalid Email");
        User user = userRepository.findByEmailAndStatusNot(email, UserStatus.DELETED).orElse(null);
        return user != null;
    }


    //	=============================================================

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
        Assert.isTrue(isEmailValid(email), "Invalid Email");

        EmailDetails emailDetails = new EmailDetails();

        String subject = Optional.ofNullable(request.getSubject()).orElse("ThaiNow Report").trim();
        String msgBody = Optional.ofNullable(request.getMsgBody()).orElse("").trim();

        emailDetails.setSubject(subject);
        emailDetails.setRecipient(email);
        emailDetails.setMsgBody(msgBody);

        return emailDetails;
    }


}
