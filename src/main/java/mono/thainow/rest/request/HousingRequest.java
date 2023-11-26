package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;

@Getter
public class HousingRequest extends PostRequest {

    private String title;

    private String address;

    private String placeid;

    private List<StorageRequest> pictures;

    private final TreeMap<String, String> contactInfo = null;

    private final TreeMap<String, Integer> interior = null;

    private final TreeSet<String> amenities = null;

    private String type;

    private Double dailyCost;

    private Double monthlyCost;

    private Double annualCost;

    private Double depositCost;

    private String category;

    private String description;

    private LocalDateTime expiredOn;

    private PostStatus status;

}
