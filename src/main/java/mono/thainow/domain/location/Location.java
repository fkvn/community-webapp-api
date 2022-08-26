package mono.thainow.domain.location;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
import org.hibernate.envers.Audited;
import org.springframework.data.annotation.Transient;
import org.springframework.util.Assert;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
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
@JsonView(View.Basic.class)
@Audited( withModifiedFlag = true )
public class Location implements Serializable{
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
	private String description;
	
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
	private double lat;

	@Column(name = "LOCATION_LNG")
	private double lng;
	
//  Full Detail Property
	
	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "LOCATION_CREATED_ON")
	@JsonView(View.FullDetail.class)
	private Date createdOn = new Date();

	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "LOCATION_UPDATED_ON")
	@JsonView(View.FullDetail.class)
	private Date updatedOn = new Date();
	
	@Column(name = "LOCATION_ADDRESS1")
	@JsonView(View.FullDetail.class)
	private String address1 = "";

	@Column(name = "LOCATION_ADDRESS2")
	@JsonView(View.FullDetail.class)
	private String address2 = "";

	@Column(name = "LOCATION_NEIGHBERHOOD")
	@JsonView(View.FullDetail.class)
	private String neighberhood = "";

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
