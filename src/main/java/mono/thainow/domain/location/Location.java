package mono.thainow.domain.location;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;
import lombok.*;
import mono.thainow.domain.user.User;
import mono.thainow.util.LocationUtil;
import mono.thainow.view.View;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;
import org.hibernate.search.mapper.pojo.bridge.builtin.annotation.Latitude;
import org.hibernate.search.mapper.pojo.bridge.builtin.annotation.Longitude;
import org.springframework.data.annotation.Transient;
import org.springframework.util.Assert;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(indexes = {@Index(name = "location_placeid_UNIQUE", columnList = "LOCATION_PLACEID", unique = true),
        @Index(name = "location_formattedAddress_UNIQUE", columnList = "LOCATION_FORMATTED_ADDRESS", unique = true),
        @Index(name = "location_fullAddress_UNIQUE", columnList = "LOCATION_FULL_ADDRESS", unique = true),
        @Index(name = "location_lat_UNIQUE", columnList = "LOCATION_LAT", unique = true),
        @Index(name = "location_lng_UNIQUE", columnList = "LOCATION_LNG", unique = true)})
@JsonView(View.Basic.class)
@Audited(withModifiedFlag = true)
public class Location implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

//	Basic Information

    @Id
    @GeneratedValue
    @JsonIgnore
    private Long id;

    @Column(name = "LOCATION_PLACEID")
    private String placeid;

    @Column(name = "LOCATION_FORMATTED_ADDRESS")
    private String address;

    @Column(name = "LOCATION_CITY")
    @NotEmpty(message = "Location city can't be empty")
    private String locality = "";

    @Column(name = "LOCATION_STATE")
    @NotEmpty(message = "Location state can't be empty")
    private String state = "";

    @Column(name = "LOCATION_ZIPCODE")
    @Size(min = 0, max = 5)
    private String zipcode = "";

    @Column(name = "LOCATION_LAT")
    @Latitude
    private double lat;

    @Column(name = "LOCATION_LNG")
    @Longitude
    private double lng;

//  Full Detail Property

    @CreationTimestamp
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "LOCATION_CREATED_ON")
    @JsonView(View.FullDetail.class)
    private LocalDateTime createdOn;

    @UpdateTimestamp
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "LOCATION_UPDATED_ON")
    @JsonView(View.FullDetail.class)
    private LocalDateTime updatedOn;

    @Column(name = "LOCATION_ADDRESS1")
    @JsonView(View.FullDetail.class)
    private String address1 = "";

    @Column(name = "LOCATION_ADDRESS2")
    @JsonView(View.FullDetail.class)
    private String address2 = "";

    @Column(name = "LOCATION_NEIGHBERHOOD")
    @JsonView(View.FullDetail.class)
    private String neighbourhood = "";

    @Column(name = "LOCATION_COUNTY")
    @JsonView(View.FullDetail.class)
    private String county = "";

    @Column(name = "LOCATION_COUNTRY")
    @JsonView(View.FullDetail.class)
    private String country = "USA";

    @Column(name = "LOCATION_FULL_ADDRESS")
    @JsonView(View.FullDetail.class)
    private String fullAddress;

    @Column(name = "LOCATION_TYPE")
    @JsonView(View.FullDetail.class)
    private String type;

//  Request ONLY	

    @JsonIgnore
    @OneToMany(mappedBy = "location", fetch = FetchType.LAZY)
    private List<User> users = new ArrayList<>();

    @Transient
    @JsonIgnore
    public String getFullAddress() {
        this.fullAddress = LocationUtil.getFullAddress(this);
        return this.fullAddress;
    }

//	Configuration Setting

    @PrePersist
    public void validateLocation() {
        this.fullAddress = LocationUtil.getFullAddress(this);

        if (!this.zipcode.isEmpty()) {
//		assert zipcode has exact 5 digits
            String zipcodePattern = "^\\d{5}(-\\d{4})?$";
            boolean isValidZipcode = this.zipcode.matches(zipcodePattern);
            Assert.isTrue(isValidZipcode, "Invalid Zipcode!");
        }

//		assert location has city, state, and zipcode
        Assert.isTrue(!this.locality.equals("") && !this.state.equals(""),
                "Invalid city and state");
    }

}
