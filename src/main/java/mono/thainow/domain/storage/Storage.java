package mono.thainow.domain.storage;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonValue;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.view.View;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;

@RequiredArgsConstructor
@EqualsAndHashCode
@Entity
@Getter
@Setter
@Audited(withModifiedFlag = true)
@JsonView(View.Basic.class)
public class Storage implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @Column(name = "STORAGE_NAME")
    private String name = "";

    @JsonIgnore
    @Column(name = "STORAGE_TYPE")
    private String type = "";

    @Column(name = "STORAGE_URL")
    private String url;

    @JsonIgnore
    @Column(name = "STORAGE_SIZE")
    private Long size = (long) 0;

    @CreationTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "STORAGE_CREATED_ON")
    private LocalDateTime createdOn;

    @UpdateTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "STORAGE_UPDATED_ON")
    private LocalDateTime updatedOn;

    @JsonValue
    public String toString() {
        //		String SOURCE_URL = "https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%%2F%s?alt=media";
        String SOURCE_CDN_URL = "/cdn/image/thainow-service-worker%%2F%s?alt=media";

        boolean isNoCached = true;

        String url = isNoCached ? this.url :
                String.format(SOURCE_CDN_URL, URLEncoder.encode(this.name, StandardCharsets.UTF_8));

        return url;
    }

}
