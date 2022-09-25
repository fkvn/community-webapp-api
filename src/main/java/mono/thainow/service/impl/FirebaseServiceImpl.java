package mono.thainow.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;

import mono.thainow.configuration.FirebaseConfig;
import mono.thainow.domain.storage.FirebaseStorageClient;
import mono.thainow.service.FirebaseService;

@Service
public class FirebaseServiceImpl implements FirebaseService {

	@Autowired
	private FirebaseStorageClient fbStorageClient;
	
	@Override
	public String uploadFile(File file, String fileName, String fileType) {
		
		String DOWNLOAD_URL = "https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%%2F%s?alt=media";
//		String DOWNLOAD_URL = "/cdn/image/thainow-service-worker%%2F%s?alt=media";
		
		
		BlobId blobId = BlobId.of(FirebaseConfig.getSTORAGE_BUCKET_URL(), "thainow-service-worker/" + fileName);
		BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType(fileType).build();
		
		try {
			
//			persist to firebase bucket
			fbStorageClient.getBucket().getStorage().create(blobInfo, Files.readAllBytes(file.toPath()));
			
//			return DOWNLOAD_URL
			return String.format(DOWNLOAD_URL, URLEncoder.encode(fileName, StandardCharsets.UTF_8));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
