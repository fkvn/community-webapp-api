package mono.thainow.domain.user;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.company.Company;

@Entity
@DiscriminatorValue("CLASSIC")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Table
public class BusinessUser extends User {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@OneToMany(mappedBy="administrator")
	private List<Company> companies = new ArrayList<>();

}
