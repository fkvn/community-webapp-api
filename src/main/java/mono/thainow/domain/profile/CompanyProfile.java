package mono.thainow.domain.profile;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.company.CompanyStatus;
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

	public CompanyProfile(User owner, Company company) {
		this.setAccount(owner);
		setProfileInfo(company);
	}

	@Column(name = "COMPANY_ID")
	private Long companyId;

	public void setProfileInfo(Company company) {
		this.setCompanyId(company.getId());
		this.setUsername(company.getName());
		this.setPicture(company.getLogo());
		setProfileStatus(company.getStatus());
	}

	public void setProfileStatus(CompanyStatus status) {
		switch (status) {
		case REGISTERED:
			this.setStatus(ProfileStatus.ACTIVATED);
			break;
		case PENDING:
			this.setStatus(ProfileStatus.PENDING);
			break;
		default:
			this.setStatus(ProfileStatus.DELETED);
		}
	}

}
