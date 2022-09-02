package mono.thainow.domain.profile;

import java.io.Serializable;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.user.User;
import mono.thainow.view.View;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "PROFILE_TYPE", discriminatorType = DiscriminatorType.STRING)
@JsonView(View.Basic.class)
public abstract class Profile implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

//	Basic Information
	
	@Id
	@GeneratedValue
	private Long id;

	@JsonProperty("type")
	public String getDecriminatorValue() {
		return this.getClass().getAnnotation(DiscriminatorValue.class).value();
	}
	
	public abstract Object getInfo();
	
//	Request ONLY
	
	@ManyToOne
	@JsonIgnore
//	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
//	@JsonIdentityReference(alwaysAsId = true)
	private User account;
}
