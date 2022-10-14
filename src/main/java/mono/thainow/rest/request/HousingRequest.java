package mono.thainow.rest.request;

import java.util.Date;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

@Getter
public class HousingRequest extends PostRequest {

	private String title;

	private String address;

	private String placeid;

	private List<StorageRequest> pictures;

	private TreeMap<String, String> contactInfo = null;

	private TreeMap<String, Integer> interior = null;

	private TreeSet<String> amenities = null;

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
