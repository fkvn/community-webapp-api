package mono.thainow.service;

import java.io.File;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface StorageService {

	Map<String, Object> upload(MultipartFile file);

	String getFileName(MultipartFile file);
	
	String getExtension(String fileName);
	
	File convertToFile(MultipartFile multipartFile, String fileName);
	
	String uploadFile(File file, String fileName, String fileType);
}
