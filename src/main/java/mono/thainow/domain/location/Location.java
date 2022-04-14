package mono.thainow.domain.location;

import java.io.Serializable;
import java.util.ArrayList;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.user.User;
import mono.thainow.util.LocationUtil;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Table(indexes = { @Index(name = "location_placeid_UNIQUE", columnList = "LOCATION_PLACEID", unique = true), })
public class Location implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "LOCATION_ID")
	private Long id;

	@Column(name = "LOCATION_PLACEID")
	private String placeid;

	@Column(name = "LOCATION_ADDRESS1")
	private String address1 = "";

	@Column(name = "LOCATION_ADDRESS2")
	private String address2 = "";

	@Column(name = "LOCATION_NEIGHBERHOOD")
	private String neighberhood = "";

	@Column(name = "LOCATION_CITY")
	@NotEmpty(message = "Location city can't be empty")
	private String locality = "";

	@Column(name = "LOCATION_COUNTY")
	private String county = "";

	@Column(name = "LOCATION_STATE")
	@NotEmpty(message = "Location state can't be empty")
	private String state = "";

	@Column(name = "LOCATION_COUNTRY")
	private String country = "USA";

	@Column(name = "LOCATION_ZIPCODE")
	@NotEmpty(message = "Location zipcode can't be empty")
	@Size(min = 5, max = 5)
	private String zipcode = "";

	@Column(name = "LOCATION_FORMATTED_ADDRESS")
	private String formattedAddress = "";
	
	@Column(name = "LOCATION_FULL_ADDRESS")
	private String fullAddress = "";

	@Column(name = "LOCATION_LAT")
	private String lat;

	@Column(name = "LOCATION_LNG")
	private String lng;
	
	@OneToMany(mappedBy="location")
	@JsonIgnore
	private List<User> users = new ArrayList<>();
  
	@PrePersist
	public void prePersist() {
		this.formattedAddress = LocationUtil.getFormattedAddress(this);
		this.fullAddress = LocationUtil.getFullAddress(this);
	}
	
	public String getFormattedAddress() {
		this.formattedAddress = LocationUtil.getFormattedAddress(this);
		return this.formattedAddress;
	}
	
	public String getFullAddress() {
		this.fullAddress = LocationUtil.getFullAddress(this);
		return this.fullAddress;
	}

}
