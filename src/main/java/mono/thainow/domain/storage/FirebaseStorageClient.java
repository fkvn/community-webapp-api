package mono.thainow.domain.storage;

import org.springframework.stereotype.Component;

import com.google.cloud.storage.Bucket;
import com.google.firebase.cloud.StorageClient;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Component
public class FirebaseStorageClient {
	
	private Bucket bucket;
	
	public FirebaseStorageClient() {
		this.bucket = StorageClient.getInstance().bucket();
	}
}
