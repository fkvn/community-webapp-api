package mono.thainow.service;

public interface TwilioService {
	void sendVerficationToken(String phone, String region, String email, String channel);
	
	void checkVerficationToken(String phone, String region, String email, String channel, String token);
}
