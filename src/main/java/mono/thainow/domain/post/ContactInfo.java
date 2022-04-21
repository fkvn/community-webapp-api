package mono.thainow.domain.post;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.URL;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.Location;
import mono.thainow.util.PhoneUtil;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
public class ContactInfo implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name = "CONTACT_ID")
	private Long id;
	
	@Email(message = "Email is not valid")
	@Column(name = "CONTACT_EMAIL")
	private String email;

	@Column(name = "CONTACT_PHONE")
	private String phone;
	
	@Column(name = "CONTACT_WEBSITE")
	@URL(regexp = "(?i)^(?:http://|https://).*", message = "Contact website must be a valid URL")
	private String website;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	private Location location;
	
	@Lob
	@Column(name = "CONTACT_MESSAGE")
	private String message;
	
	@PrePersist
	private void validateContactInfo() {
//		validate phone number
		PhoneUtil.validatePhoneNumberWithGoogleAPI(this.phone, "US");
	}
}
