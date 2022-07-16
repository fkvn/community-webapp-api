//package mono.thainow.domain.user;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.persistence.DiscriminatorValue;
//import javax.persistence.Entity;
//import javax.persistence.OneToMany;
//import javax.persistence.Table;
//
//import com.fasterxml.jackson.annotation.JsonIdentityInfo;
//import com.fasterxml.jackson.annotation.JsonIdentityReference;
//import com.fasterxml.jackson.annotation.ObjectIdGenerators;
//
//import lombok.Getter;
//import lombok.RequiredArgsConstructor;
//import lombok.Setter;
//import lombok.ToString;
//import mono.thainow.domain.company.Company;
//
//@Entity
//@DiscriminatorValue("BUSINESS")
//@Getter
//@Setter
//@ToString
//@RequiredArgsConstructor
//@Table
//public class BusinessUser extends User {
//	/**
//	 * 
//	 */
//	private static final long serialVersionUID = 1L;
//
//	@OneToMany(mappedBy = "administrator")
//	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
//	@JsonIdentityReference(alwaysAsId = true)
//	private List<Company> companies = new ArrayList<>();
//
////	public List<Company> getCompanies() {
////		return this.companies.stream().filter(comp -> comp.getStatus() == CompanyStatus.REGISTERED)
////				.collect(Collectors.toList());
////	}
//
//}
