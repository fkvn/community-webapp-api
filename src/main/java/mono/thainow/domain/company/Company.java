package mono.thainow.domain.company;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotEmpty;

import org.hibernate.validator.constraints.URL;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.BusinessUser;

@Entity
@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class Company implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	private static final String DEFAULT_COMP_INDUSTRY = "Aquarium and Pet;Attorney;Auto Service;Bank;Bar;Bodyshop;Book Store;Bookkeeping;Boxing;Car Dealer;Car Towing;Chiropractic;Clothing;Community Service;Construction;Consulate;Consultant;Cosmetic;Credit Card Services;Dance;Dentist;Doctor Clinic;Drink and Dessert;DVD, CD, Games;Education;Elderly Care;Embassy;Factory;Flower;Fusion Restaurant;Gift Shop;Hair Salon;Handyman;Insurance;Japanese Restaurant;Jewelry and Watch;Market;Mobile;Money Transfer;Nail;Newspaper;Notary Public;Optical;Others;Painter;Personal Trainer;Printing;Real Estate;School;Shipping;Tailor;Tax;Taxi;Television;Thai Church;Thai Massage;Thai Restaurant;Thai Temple;Trader;Travel Agency;Vegan Restaurant";

	@Id
	@GeneratedValue
	@Column(name = "COMPANY_ID")
	private Long id;

	@NotEmpty
	@Column(name = "COMPANY_INDUSTRY")
	private String industry;
	
	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	private Location location;
	
	@Column(name = "COMPANY_EMAIL")
	private String email;
	
	@Column(name = "IS_COMPANY_EMAIL_VERIFIED")
	private boolean isEmailVerified = false;
	
	@Column(name = "COMPANY_PHONE")
	private String phone;
	
	@Column(name = "IS_COMPANY_PHONE_VERIFIED")
	private boolean isPhoneVerified = false;
	
	@Lob
	@Column(name = "COMPANY_DESCRIPTION")
	private String description;
	
	@Column(name = "COMPANY_WEBSITE")
	@URL(regexp = "(?i)^(?:http://|https://).*", message = "Company website must be a valid URL")
	private String website;
	
	@Column(name = "COMPANY_FOUNDED")
	private String founded;
	
	@Column(name = "COMPANY_REVENUE")
	private String revenue;
	
	@Column(name = "COMPANY_SIZE")
	private String size;
	
	@ManyToOne
	@JoinColumn(name = "ADMINISTRATOR_ID")
	private BusinessUser administrator;
	
	@Column(name = "ADMINISTRATOR_ROLE")
	private String administratorRole;
	
	public static String getDefaultCompIndustry() {
		return DEFAULT_COMP_INDUSTRY;
	}

}
