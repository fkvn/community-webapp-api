package mono.thainow.rest.request;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

@Getter
public class HousingRequest extends PostRequest {

	private String title;
	
	private String address;
	
	private String placeid;
	
	private List<StorageRequest> pictures;
	
	private Map<String, String> contactInfo;
	
	private Map<String, Integer> interior;
	
	private List<String> amenities;
	
	private String type;
	
	private Double dailyCost;
	
	private Double monthlyCost;
	
	private Double annualCost;
	
	private Double depositCost;
	
	private String category;
	
	private String description;
	
	private Date expiredOn;
	
	private PostStatus status;

}
