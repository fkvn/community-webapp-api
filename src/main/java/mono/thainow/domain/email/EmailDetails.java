package mono.thainow.domain.email;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class EmailDetails implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private Long id;

    @CreationTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "EMAIL_CREATED_ON")
    private LocalDateTime createdOn;

    @UpdateTimestamp
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "EMAIL_UPDATED_ON")
    private LocalDateTime updatedOn;

    private String recipient;

    @Lob
    private String msgBody;

    private String subject;

}
