package mono.thainow.domain.company;

import java.io.Serializable;
import java.util.Date;

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
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.FullTextField;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;
import org.hibernate.validator.constraints.URL;
import org.springframework.util.Assert;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIdentityReference;
import com.fasterxml.jackson.annotation.JsonProperty;
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
@Indexed
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
	@FullTextField
//	@KeywordField
	private String name;

	@NotEmpty
	@Column(name = "COMPANY_INDUSTRY")
	private String industry;

	@Column(name = "COMPANY_EMAIL")
	private String email;

	@Column(name = "IS_COMPANY_EMAIL_VERIFIED")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private boolean isEmailVerified = false;

	@Column(name = "COMPANY_PHONE")
	private String phone;

	@Column(name = "IS_COMPANY_PHONE_VERIFIED")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private boolean isPhoneVerified = false;

	@Lob
	@Column(name = "COMPANY_DESCRIPTION")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String description;

	@Column(name = "COMPANY_WEBSITE")
	@URL(regexp = "(?i)^(?:http://|https://).*", message = "Company website must be a valid URL")
	private String website;

	@Column(name = "COMPANY_FOUNDED")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String founded;

	@Column(name = "COMPANY_REVENUE")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String revenue;

	@Column(name = "COMPANY_SIZE")
	private String size;

	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "COMPANY_CREATED_ON")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private Date createdOn = new Date();

	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	@Column(name = "COMPANY_UPDATED_ON")
	private Date updatedOn = new Date();

	@NotNull
	@Enumerated(EnumType.STRING)
	@Column(name = "COMPANY_STATUS")
	private CompanyStatus status = CompanyStatus.UNREGISTERED;

	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	@NotNull
	private Location address;
	
	@Column(name = "COMPANY_FIXED_POSTION")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private Integer fixedPostion;
	
	@Column(name = "COMPANY_WEIGHT")
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private int weight  = 0;

	@ManyToOne
	@JoinColumn(name = "ADMINISTRATOR_ID")
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
	@JsonIdentityReference(alwaysAsId = true)
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private BusinessUser administrator;

	@Column(name = "ADMINISTRATOR_ROLE")
	private String administratorRole;

//	public static String getDefaultCompIndustry() {
//		return DEFAULT_COMP_INDUSTRY;
//	}

	@PrePersist
	private void validateCompany() {
		
//		assert that the industry is valid
		Assert.isTrue(!this.industry.isEmpty() && DEFAULT_COMP_INDUSTRY.contains(this.industry),
				"Invalid Company Industry");
		
//		assert that once we have the administrator, then the administratorRole cannot be null
		if (this.administrator != null) {
			Assert.isTrue(!this.administratorRole.isEmpty(), "Invalid Administrator Role!");
		}
		
//		assert that once we have the administrator Role, then the administrator cannot be null
		if (this.administratorRole != null && !this.administratorRole.isEmpty()) {
			Assert.isTrue(this.administrator != null, "Invalid Administrator!");
		}
	}

}
