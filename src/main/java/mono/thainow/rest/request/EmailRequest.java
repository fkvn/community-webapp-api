package mono.thainow.rest.request;

import lombok.Data;

@Data
public class EmailRequest {
	private String recipient;
	private String msgBody;
	private String subject;
}
