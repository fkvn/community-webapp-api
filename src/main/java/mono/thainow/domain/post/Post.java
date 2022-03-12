package mono.thainow.domain.post;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.AddressDisplayType;
import mono.thainow.domain.user.User;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
public class Post implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "POST_ID")
	private Long id;

	@NotNull(message = "Post Type can't be null!")
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "POST_TYPE")
	private PostType type;

	@Column(name = " POST_DESCRIPTION")
	private String description = "";

	@NotNull
	@CreationTimestamp
	@Column(name = "POST_CREATED_ON")
	private Date createdOn;

	@NotNull
	@UpdateTimestamp
	@Column(name = "POST_UPDATED_ON")
	private Date updatedOn;

	@NotNull(message = "Post status can't be null!")
	@Enumerated(EnumType.ORDINAL)
	@Column(name = "POST_STATUS")
	private PostStatus status;

	@Enumerated(EnumType.ORDINAL)
	@Column(name = "POST_ADDR_DISPLAY_TYPE")
	private AddressDisplayType addrDisplayType = AddressDisplayType.FULL_ADDRESS;

	@PositiveOrZero
	@Column(name = "POST_AVG_RATING")
	private Long avgRating = (long) 0;

	@PositiveOrZero
	@Column(name = "NUMBER_OF_VIEWS")
	private Long numOfviews = (long) 0;

	@PositiveOrZero
	@Column(name = "NUMBER_OF_SHARES")
	private Long numOfShares = (long) 0;
	
//	// post owner - author
//	@ManyToOne(cascade = CascadeType.PERSIST)
//	@JoinColumn(name = "AUTHOR_ID")
//	private User author;
}
