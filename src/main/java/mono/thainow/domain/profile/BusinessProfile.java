package mono.thainow.domain.profile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.user.User;
import org.hibernate.envers.Audited;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.IndexedEmbedded;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("BUSINESS_PROFILE")
@Audited(withModifiedFlag = true)
public class BusinessProfile extends Profile {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @OneToOne
    @JsonIgnore
    @IndexedEmbedded
    private Company company;

    public BusinessProfile(User owner, Company company) {
        this.setAccount(owner);
        this.company = company;
    }

    @Override
    public Object getDetails() {
        //		this.getCompany().setProfileId(this.getId());
        return this.getCompany();
    }

}
