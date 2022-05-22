package mono.thainow.rest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import mono.thainow.domain.storage.FirebaseRealtime;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.rest.response.StorageResponse;
import mono.thainow.service.StorageService;

@RestController
//@PreAuthorize("hasAnyAuthority('ALL_STORAGE_MANAGE')")
@RequestMapping("/api/storages")
public class StorageController {

	@Autowired
	StorageService storageService;
	
	
	@Autowired
	FirebaseRealtime fbRealtimeDb;
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED) 
	public StorageResponse uploadStorage(@RequestParam("file") MultipartFile file) {
		return storageService.upload(file);
	}
	
	@PostMapping("/save")
	@ResponseStatus(HttpStatus.CREATED) 
	public Long saveStorage(@RequestBody StorageRequest storageRequest) {
		return storageService.saveStorage(storageService.getStoragefromStorageRequest(storageRequest)).getId();
	}
}
