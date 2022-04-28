package mono.thainow.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.storage.BlobId;
import com.google.cloud.storage.BlobInfo;

import mono.thainow.configuration.FirebaseConfig;
import mono.thainow.domain.storage.FirebaseStorageClient;
import mono.thainow.service.StorageService;

@Service
public class StorageServiceImpl implements StorageService {

	@Autowired
	private FirebaseStorageClient fbStorageClient;

	@Override
	public Map<String, Object> upload(MultipartFile multipartFile) {
		 
		String fileName = getFileName(multipartFile);      
		 
		 // to convert multipartFile to File
         File file = convertToFile(multipartFile, fileName);      
        
      // to get uploaded file link
         String TEMP_URL = uploadFile(file, fileName, multipartFile.getContentType()); 
         
         file.delete();   
        
         Map<String, Object> uploadedFile = new HashMap<>();
         uploadedFile.put("url", TEMP_URL);
         
         return uploadedFile;  
	}

	@Override
	public String getFileName(MultipartFile file) {

		String fileName = file.getOriginalFilename(); // to get original file name
		fileName = UUID.randomUUID().toString().concat(this.getExtension(fileName));

		return fileName;
	}

	@Override
	public String getExtension(String fileName) {
		return fileName.substring(fileName.lastIndexOf("."));
	}

	@Override
	public File convertToFile(MultipartFile multipartFile, String fileName) {

		File tempFile = new File(fileName);

		try (FileOutputStream fos = new FileOutputStream(tempFile)) {

			fos.write(multipartFile.getBytes());

			fos.close();

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tempFile;
	}

	@Override
	public String uploadFile(File file, String fileName, String fileType) {

		String DOWNLOAD_URL = "https://firebasestorage.googleapis.com/v0/b/mono-thainow.appspot.com/o/thainow-service-worker%%2F%s?alt=media";
		 
		BlobId blobId = BlobId.of(FirebaseConfig.getSTORAGE_BUCKET_URL(), "thainow-service-worker/" + fileName);
		BlobInfo blobInfo = BlobInfo.newBuilder(blobId).setContentType(fileType).build();
		
		try {
			fbStorageClient.getBucket().getStorage().create(blobInfo, Files.readAllBytes(file.toPath()));
			return String.format(DOWNLOAD_URL, URLEncoder.encode(fileName, StandardCharsets.UTF_8));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
