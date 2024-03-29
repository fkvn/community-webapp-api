package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Getter
public class MarketplaceRequest extends PostRequest {

    private String title;

    private String address;

    private String placeid;

    private List<StorageRequest> pictures;

    private Map<String, String> contactInfo;

    private String description;

    private Double cost;

    private String condition;

    private String category;

    private LocalDateTime expiredOn;

    private PostStatus status;
}
