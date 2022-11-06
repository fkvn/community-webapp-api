package mono.thainow.dao;

import mono.thainow.domain.email.EmailDetails;

public interface EmailDao {
	EmailDetails saveEmail(EmailDetails email);
}
