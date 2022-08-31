package mono.thainow.rest.request;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

@Getter
public class JobRequest extends PostRequest {
	
	private String title;
	
	private String address;
	
	private String placeid;
	
	private List<StorageRequest> pictures;
	
	private Map<String, String> contactInfo;
	
	private List<String> positions;
	
	private String salary;
	
	private String skills;
	
	private String experience;
	
	private String description;
	
	private Date expiredOn;
	
	private PostStatus status;

}
