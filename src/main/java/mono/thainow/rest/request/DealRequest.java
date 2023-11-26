package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.TreeMap;

@Getter
public class DealRequest extends PostRequest {

    private String title;

    private String address;

    private String placeid;

    private List<StorageRequest> pictures;

    private final TreeMap<String, String> contactInfo = null;

    private String description;

    private String category;

    private LocalDateTime expiredOn;

    private PostStatus status;
}
