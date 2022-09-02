package mono.thainow.domain.profile;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.user.User;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("COMPANY_PROFILE")
public class CompanyProfile extends Profile {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@OneToOne
	@JsonIgnore
//	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
//	@JsonIdentityReference(alwaysAsId = true)
	private Company company;

	public CompanyProfile(User owner, Company company) {
		this.setAccount(owner);
		this.company = company;
	}

	@Override
	public Object getInfo() {

		return this.getCompany();
	}

}
