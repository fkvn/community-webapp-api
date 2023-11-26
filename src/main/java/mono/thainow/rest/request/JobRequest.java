package mono.thainow.rest.request;

import lombok.Getter;
import mono.thainow.domain.post.PostStatus;

import java.time.LocalDateTime;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;

@Getter
public class JobRequest extends PostRequest {

    private String title;

    private String address;

    private String placeid;

    private List<StorageRequest> pictures;

    private final TreeMap<String, String> contactInfo = null;

    private final TreeSet<String> positions = null;

    private Boolean isRemote;

    private String salary;

    private String skills;

    private String experience;

    private String description;

    private LocalDateTime expiredOn;

    private PostStatus status;

}
