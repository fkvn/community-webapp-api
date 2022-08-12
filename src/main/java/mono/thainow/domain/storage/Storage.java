package mono.thainow.domain.storage;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonValue;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@RequiredArgsConstructor
@Getter
@Setter
@ToString
@EqualsAndHashCode
@Entity
public class Storage implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
    private Long id;
	
	@JsonIgnore
	@Column(name = "STORAGE_NAME")
	private String name = "";

	@JsonIgnore
	@Column(name = "STORAGE_TYPE")
	private String type = "";
	
	@JsonValue
	@Column(name = "STORAGE_URL")
	private String url;

	@JsonIgnore
	@Column(name = "STORAGE_SIZE")
	private Long size = (long) 0;
	
	@CreationTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "STORAGE_CREATED_ON")
	private Date createdOn = new Date();
 
	@UpdateTimestamp
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "STORAGE_UPDATED_ON")
	private Date updatedOn = new Date();
	

}
