package mono.thainow.service;

import java.io.File;

import org.springframework.web.multipart.MultipartFile;

import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.response.StorageResponse;

public interface StorageService {

	StorageResponse upload(MultipartFile file);

	String getFileName(MultipartFile file);
	
	String getExtension(String fileName);
	
	File convertToFile(MultipartFile multipartFile, String fileName);
	
	String uploadFile(File file, String fileName, String fileType);
	
	Storage saveStorage(Storage storage);
}
