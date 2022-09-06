package mono.thainow.domain.post;

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

import org.hibernate.envers.Audited;
import org.hibernate.search.mapper.pojo.mapping.definition.annotation.Indexed;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.profile.Profile;
import mono.thainow.view.View;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "POST_TYPE", discriminatorType = DiscriminatorType.STRING)
@JsonView(View.Basic.class)
@Indexed
public abstract class Post implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;

	@ManyToOne
	@JsonIgnore
	private Profile owner;

	public Profile getPostOwner() {
		return this.getOwner();
	};

	@JsonProperty("type")
	public PostType getType() {
		return PostType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
	}

	@JsonIgnore
	public abstract PostStatus getStatus();

	public abstract Object getInfo();

}
