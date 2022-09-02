package mono.thainow.rest.request;

import java.util.Date;
import java.util.List;
import java.util.TreeMap;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

@Getter
public class DealRequest extends PostRequest {

	private String title;

	private String address;

	private String placeid;

	private List<StorageRequest> pictures;

	private TreeMap<String, String> contactInfo = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);

	private String description;

	private String category;

	private Date expiredOn;

	private PostStatus status;
}
