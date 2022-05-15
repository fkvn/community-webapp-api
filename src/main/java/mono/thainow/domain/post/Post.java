package mono.thainow.domain.post;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PositiveOrZero;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.Transient;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.company.Company;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.user.User;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name = "POST_TYPE", discriminatorType = DiscriminatorType.STRING)
public class Post implements Serializable {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "POST_ID")
	private Long id;
	
	@Lob
	@Column(name = "POST_DESCRIPTION")
	private String description;
	
	@Column(name = "POST_Title")
	private String title;

	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "POST_CREATED_ON")
	private Date createdOn = new Date();
 
	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "POST_UPDATED_ON")
	private Date updatedOn = new Date();

	@NotNull(message = "Post status can't be null!")
	@Enumerated(EnumType.STRING)
	@Column(name = "POST_STATUS")
	private PostStatus status;
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "LOCATION_ID")
	private Location location;
	
	// post owner - author
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "AUTHOR_ID")
	@JsonIgnore
	private User author;
	
	@Column(name = "IS_COMPANY_POST")
	private boolean isCompanyPost = false;
	
	// Company post
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "COMPANY_ID")
	private Company company;

	@PositiveOrZero
	@Column(name = "POST_AVG_RATING")
	private Long avgRating = (long) 0;

	@OneToOne
	@JoinColumn(name=" POST_CONTACT_INFO")
	private ContactInfo contactInfo;

	@Transient
	public PostType getPostType() {
		return PostType.valueOf(this.getClass().getAnnotation(DiscriminatorValue.class).value());
	}
}
