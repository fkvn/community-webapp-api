package mono.thainow.domain.user;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@DiscriminatorValue("CLASSIC")
public class ClassicUser extends User {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

}
