package mono.thainow.rest.request;

import java.util.Date;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

@Getter
public class JobRequest extends PostRequest {
	
	private String title;
	
	private String address;
	
	private String placeid;
	
	private List<StorageRequest> pictures;
	
	private TreeMap<String, String> contactInfo = null;
	
	private TreeSet<String> positions = null;
	
	private Boolean isRemote;
	
	private String salary;
	
	private String skills;
	
	private String experience;
	
	private String description;
	
	private Date expiredOn;
	
	private PostStatus status;

}
