package mono.thainow.domain.location;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.Transient;
import org.springframework.util.Assert;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.user.User;
import mono.thainow.util.LocationUtil;
import mono.thainow.view.View;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(indexes = { @Index(name = "location_placeid_UNIQUE", columnList = "LOCATION_PLACEID", unique = true),
		@Index(name = "location_formattedAddress_UNIQUE", columnList = "LOCATION_FORMATTED_ADDRESS", unique = true),
		@Index(name = "location_fullAddress_UNIQUE", columnList = "LOCATION_FULL_ADDRESS", unique = true),
		@Index(name = "location_lat_UNIQUE", columnList = "LOCATION_LAT", unique = true),
		@Index(name = "location_lng_UNIQUE", columnList = "LOCATION_LNG", unique = true) })
public class Location implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	// public property
	
	@Id
	@GeneratedValue
	@JsonView({View.Company.Basic.class, View.UserView.Public.class})
	private Long id;

	@Column(name = "LOCATION_PLACEID")
	@JsonView({View.Company.Basic.class, View.UserView.Public.class})
	private String placeid;

	@Column(name = "LOCATION_FORMATTED_ADDRESS")
	@JsonView({View.Company.Basic.class, View.UserView.Public.class})
	private String description;
	
	@Column(name = "LOCATION_CITY")
	@NotEmpty(message = "Location city can't be empty")
	@JsonView({View.Company.Basic.class, View.UserView.Public.class})
	private String locality = "";
	
	@Column(name = "LOCATION_STATE")
	@NotEmpty(message = "Location state can't be empty")
	@JsonView({View.Company.Basic.class, View.UserView.Public.class})
	private String state = "";
	
	@Column(name = "LOCATION_ZIPCODE")
	@Size(min = 0, max = 5)
	@JsonView({View.Company.Basic.class, View.UserView.Public.class})
	private String zipcode = "";
	
	@Column(name = "LOCATION_LAT")
	@JsonView({View.Company.Basic.class, View.UserView.Public.class})
	private double lat;

	@Column(name = "LOCATION_LNG")
	@JsonView({View.Company.Basic.class, View.UserView.Public.class})
	private double lng;
	
	// Private Property
	
	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "LOCATION_CREATED_ON")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private Date createdOn = new Date();

	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "LOCATION_UPDATED_ON")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private Date updatedOn = new Date();
	
	@Column(name = "LOCATION_ADDRESS1")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String address1 = "";

	@Column(name = "LOCATION_ADDRESS2")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String address2 = "";

	@Column(name = "LOCATION_NEIGHBERHOOD")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String neighberhood = "";

	@Column(name = "LOCATION_COUNTY")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String county = "";

	@Column(name = "LOCATION_COUNTRY")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String country = "USA";

	@Column(name = "LOCATION_FULL_ADDRESS")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String fullAddress;

	@Column(name = "LOCATION_TYPE")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String type;
	
	// Request Only	

	@JsonIgnore
	@OneToMany(mappedBy = "location")
	private List<User> users = new ArrayList<>();
	
	@Transient
	@JsonIgnore
	public String getFullAddress() {
		this.fullAddress = LocationUtil.getFullAddress(this);
		return this.fullAddress;
	}
	
	// Config
	
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
