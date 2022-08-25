package mono.thainow.domain.post.job;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.MapKeyColumn;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.hibernate.envers.Audited;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonView;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import mono.thainow.domain.location.Location;
import mono.thainow.domain.post.PostStatus;
import mono.thainow.domain.storage.Storage;
import mono.thainow.view.View;

@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@JsonView(View.Basic.class)
@Audited( withModifiedFlag = true )
public class Job implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 1L;

//	Basic Information

	@Id
	@GeneratedValue
	@JsonIgnore
	private Long id;

	@Column(name = "JOB_TITLE")
	private String title;

	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "JOB_UPDATED_ON")
	private Date updatedOn = new Date();

	@Enumerated(EnumType.STRING)
	@Column(name = "JOB_STATUS")
	private PostStatus status = PostStatus.DISABLED;

	@ManyToOne
	@JoinColumn(name = "JOB_LOCATION_ID")
	private Location location;

	@OneToMany
	private List<Storage> pictures = new ArrayList<>();

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "JOB_EXPIRED_ON")
	private Date expiredOn;

//	Detail Information

	@ElementCollection
	@MapKeyColumn(name = "CONTACT_FIELD")
	@Column(name = "CONTACT_VALUE")
	@CollectionTable(name = "JOB_CONTACT_INFO", joinColumns = @JoinColumn(name = "JOB_ID"))
	@JsonView(View.Detail.class)
	private Map<String, String> contactInfo = new HashMap<>();

	@JsonView(View.Detail.class)
	@ElementCollection
	private List<String> positions;
	
	@Column(name = "JOB_EXPERIENCE")
	@JsonView(View.Detail.class)
	private String experience;
	
	@Column(name = "JOB_SALARY")
	@JsonView(View.Detail.class)
	private String salary;
	
	@Column(name = "JOB_SKILLS")
	@JsonView(View.Detail.class)
	private String skills;
	
	@Lob
	@Column(name = "JOB_DESCRIPTION")
	@JsonView(View.Detail.class)
	private String description;

//	Full Detail Information
	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonView(View.FullDetail.class)
	@Column(name = "JOB_CREATED_ON")
	private Date createdOn = new Date();

}