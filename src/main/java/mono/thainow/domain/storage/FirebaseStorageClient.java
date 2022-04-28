package mono.thainow.domain.storage;

import org.springframework.stereotype.Component;

import com.google.cloud.storage.Bucket;
import com.google.firebase.cloud.StorageClient;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Component
@RequiredArgsConstructor
public class FirebaseStorageClient {
	
	private Bucket bucket = null;
	
	public Bucket getBucket() {
		this.bucket = StorageClient.getInstance().bucket();
		return this.bucket;
	}
	
}
