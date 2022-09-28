package mono.thainow.service;

import java.io.File;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.rest.response.StorageResponse;

public interface StorageService {

	StorageResponse upload(MultipartFile file);

	String fetchFileName(MultipartFile file);
	
	String fetchExtension(String fileName);
	
	File convertToFile(MultipartFile multipartFile, String fileName);
	
	String uploadFile(File file, String fileName, String fileType);
	
	Storage saveStorage(Storage storage);
	
	Storage findStorageById(Long id);
	
	Storage findStorageByName(String fileName);

	Storage findStorageByUrl(String url);

	Storage fetchStorageFromRequest(StorageRequest req);
	
	List<Storage> fetchStoragesFromRequests(List<StorageRequest> reqs);
}
