package mono.thainow.domain.company;

import java.io.Serializable;
import java.util.Date;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.validator.constraints.URL;
import org.springframework.util.Assert;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

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
@Table(indexes = { @Index(name = "company_name_UNIQUE", columnList = "COMPANY_NAME", unique = true) })
public class Company implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	private static final String DEFAULT_COMP_INDUSTRY = "Aquarium and Pet;Attorney;Auto Service;Bank;Bar;Bodyshop;Book Store;Bookkeeping;Boxing;Car Dealer;Car Towing;Chiropractic;Clothing;Community Service;Construction;Consulate;Consultant;Cosmetic;Credit Card Services;Dance;Dentist;Doctor Clinic;Drink and Dessert;DVD, CD, Games;Education;Elderly Care;Embassy;Factory;Flower;Fusion Restaurant;Gift Shop;Hair Salon;Handyman;Insurance;Information Technology;Japanese Restaurant;Jewelry and Watch;Market;Mobile;Money Transfer;Nail;Newspaper;Notary Public;Optical;Others;Painter;Personal Trainer;Printing;Real Estate;School;Shipping;Tailor;Tax;Taxi;Television;Thai Church;Thai Massage;Thai Restaurant;Thai Temple;Trader;Travel Agency;Vegan Restaurant";

	@Id
	@GeneratedValue
	private Long id;

	@NotEmpty
	@Column(name = "COMPANY_NAME")
	private String name;

	@NotEmpty
	@Column(name = "COMPANY_INDUSTRY")
	private String industry;

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

	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "COMPANY_CREATED_ON")
	private Date createdOn = new Date();

	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "COMPANY_UPDATED_ON")
	private Date updatedOn = new Date();

	@NotNull
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "COMPANY_STATUS")
	private CompanyStatus status = CompanyStatus.UNREGISTERED;

	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.PERSIST })
	@JoinColumn(name = "LOCATION_ID")
	private Location location;

	@ManyToOne
	@JoinColumn(name = "ADMINISTRATOR_ID")
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
	@JsonIdentityReference(alwaysAsId = true)
	private BusinessUser administrator;

	@Column(name = "ADMINISTRATOR_ROLE")
	private String administratorRole;

	public static String getDefaultCompIndustry() {
		return DEFAULT_COMP_INDUSTRY;
	}

	@PrePersist
	private void validateIndustry() {
		Assert.isTrue(!this.industry.isEmpty() && DEFAULT_COMP_INDUSTRY.contains(this.industry),
				"Invalid Company Industry");
	}

}
