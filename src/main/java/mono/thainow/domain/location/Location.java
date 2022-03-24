package mono.thainow.domain.location;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

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
	private Long placeid;

	@Column(name = "LOCATION_ADDRESS1")
	private String address1;

	@Column(name = "LOCATION_ADDRESS2")
	private String address2;

	@Column(name = "LOCATION_NEIGHBERHOOD")
	private String neighberhood;

	@Column(name = "LOCATION_CITY")
	@NotNull(message = "Location city can't be null")
	private String locality;

	@Column(name = "LOCATION_COUNTY")
	private String county;

	@NotNull(message = "Location state can't be null")
	@Column(name = "LOCATION_STATE")
	private String state;

	@Column(name = "LOCATION_COUNTRY")
	private String country = "USA";

	@NotNull(message = "Location zipcode can't be null")
	@Column(name = "LOCATION_ZIPCODE")
	private String zipcode;

	@Column(name = "LOCATION_FORMATTED_ADDRESS")
	private String formattedAddress;

	@Column(name = "LOCATION_LAT")
	private String lat;

	@Column(name = "LOCATION_LNG")
	private String lng;

}
