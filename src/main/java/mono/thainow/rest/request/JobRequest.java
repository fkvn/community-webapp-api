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
	
	private TreeMap<String, String> contactInfo = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
	
	private TreeSet<String> positions = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);
	
	private Boolean isRemote;
	
	private String salary;
	
	private String skills;
	
	private String experience;
	
	private String description;
	
	private Date expiredOn;
	
	private PostStatus status;

}
