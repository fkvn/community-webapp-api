package mono.thainow.domain.profile;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.company.Company;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("COMPANY_PROFILE")
public class CompanyProfile extends Profile {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public CompanyProfile(Company company) {
		this.setUsername(company.getName());
	}
	
	
	@Column(name = "COMPANY_ID")
	private Long companyId;

}
