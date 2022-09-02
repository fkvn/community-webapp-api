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

	private TreeMap<String, String> contactInfo = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);

	private TreeMap<String, Integer> interior = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);

	private TreeSet<String> amenities = new TreeSet<>(String.CASE_INSENSITIVE_ORDER);

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
