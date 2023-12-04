package mono.thainow.domain.user;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.*;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.storage.Storage;
import mono.thainow.view.View;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.*;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
public class User implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    //	Basic Information

    @Id
    @GeneratedValue
    @JsonProperty("accountId")
    private Long id;

    @Column(name = "USER_USERNAME")
    private String username = "";

    @OneToOne
    private Storage picture;

    @NotNull(message = "User status can't be null!")
    @Enumerated(EnumType.STRING)
    @Column(name = "USER_STATUS")
    private UserStatus status = UserStatus.DISABLED;

    //  Detail Information

    @NotNull
    @Column(name = "USER_ISSUER")
    @Enumerated(EnumType.STRING)
    @JsonView(View.Detail.class)
    private UserProvider provider = UserProvider.THAINOW;

    @CreationTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "USER_CREATED_ON")
    @JsonView(View.Detail.class)
    private LocalDateTime createdOn;

    @UpdateTimestamp
    @JsonFormat(pattern = "MM-dd-yyyy HH:mm:ss")
    @Column(name = "USER_UPDATED_ON")
    //    @JsonView(View.Detail.class)
    private LocalDateTime updatedOn;

    @Email(message = "Email is not valid")
    @Column(name = "USER_EMAIL")
    @JsonView(View.Detail.class)
    private String email;


    @ManyToOne
    @JoinColumn(name = "LOCATION_ID")
    @JsonView(View.Detail.class)
    private Location location;

    @OneToMany
    @JsonView(View.Detail.class)
    private List<Storage> pictures = new ArrayList<>();

    @Lob
    @Column(name = "USER_DESCRIPTION")
    @JsonView(View.Detail.class)
    private String description;

    @Column(name = "USER_PHONE")
    @JsonView(View.Detail.class)
    private String phone;

    @Column(name = "USER_PHONE_REGION")
    @JsonView(View.Detail.class)
    private String phoneRegion;

    @Column(name = "USER_WEBSITE")
    //	@URL(regexp = "(?i)^(?:http://|https://).*", message = "Website url must be a valid URL")
    @JsonView(View.Detail.class)
    private String website;

    @Column(name = "USER_FIRSTNAME")
    @JsonView(View.Detail.class)
    private String firstName = "";

    @Column(name = "IS_USER_FIRSTNAME_PUBLIC")
    @JsonProperty("isFirstNamePublic")
    @JsonView(View.Detail.class)
    private boolean firstNamePublic = false;

    @Column(name = "USER_LASTNAME")
    @JsonView(View.Detail.class)
    private String lastName = "";

    @Column(name = "IS_USER_LASTNAME_PUBLIC")
    @JsonProperty("isLastNamePublic")
    @JsonView(View.Detail.class)
    private boolean lastNamePublic = false;

    @Column(name = "IS_USER_DESCRIPTION_PUBLIC")
    @JsonProperty("isDescriptionPublic")
    @JsonView(View.Detail.class)
    private boolean descriptionPublic = false;

    @Column(name = "IS_USER_EMAIL_PUBLIC")
    @JsonProperty("isEmailPublic")
    @JsonView(View.Detail.class)
    private boolean emailPublic = false;

    @Column(name = "IS_USER_PHONE_PUBLIC")
    @JsonProperty("isPhonePublic")
    @JsonView(View.Detail.class)
    private boolean phonePublic = false;

    @Column(name = "IS_USER_LOCATION_PUBLIC")
    @JsonProperty("isLocationPublic")
    @JsonView(View.Detail.class)
    private boolean locationPublic = false;

    @Column(name = "IS_USER_WEBSITE_PUBLIC")
    @JsonProperty("isWebsitePublic")
    @JsonView(View.Detail.class)
    private boolean websitePublic = false;

    //	Full Detail Information

    @NotNull
    @Column(name = "USER_SUB")
    @JsonView(View.FullDetail.class)
    private String sub;

    @NotNull
    @Column(name = "USER_ROLE")
    @Enumerated(EnumType.STRING)
    @JsonView(View.FullDetail.class)
    private UserRole role = UserRole.CLASSIC;

    @Column(name = "USER_FULLNAME")
    @JsonView(View.FullDetail.class)
    private String fullName = firstName + lastName;

    @Column(name = "IS_USER_EMAIL_VERIFIED")
    @JsonView(View.FullDetail.class)
    private boolean isEmailVerified = false;

    @Column(name = "IS_USER_PHONE_VERIFIED")
    @JsonView(View.FullDetail.class)
    private boolean isPhoneVerified = false;

    @ElementCollection(fetch = FetchType.EAGER)
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "USER_PRIVILEGES", joinColumns = @JoinColumn(name = "USER_ID"))
    @Column(name = "USER_PRIVILEGES", nullable = false)
    private Set<UserPrivilege> privileges = new HashSet<>();


    //	Write ONLY information

    @Column(name = "USER_PASSWORD")
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;

    //	Configuration Setting

    @PrePersist
    private void validateUser() {
        this.setSub(UUID.randomUUID().toString());
        if (this.fullName.equals("")) {
            this.setFullName(this.firstName + " " + this.lastName);
        }
    }
}
