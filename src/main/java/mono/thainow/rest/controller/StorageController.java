package mono.thainow.rest.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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

	@PostMapping("/multiple")
	@ResponseStatus(HttpStatus.CREATED)
	public List<StorageResponse> uploadMultipleStorage(@RequestParam("files") MultipartFile[] files) {

		List<StorageResponse> results = new ArrayList<>();

		Arrays.asList(files).stream().forEach(file -> {
			results.add(storageService.upload(file));
		});

		return results;
	}

	@PostMapping("/save")
	@ResponseStatus(HttpStatus.CREATED)
	public Long saveStorage(@RequestBody StorageRequest storageRequest) {
		return storageService.saveStorage(storageService.getStorageFromStorageRequest(storageRequest)).getId();
	}

	@PostMapping("/save/multiple")
	@ResponseStatus(HttpStatus.CREATED)
	public List<Long> saveMultipleStorage(@RequestBody List<StorageRequest> storageRequests) {

		List<Long> results = new ArrayList<>();

		storageRequests.stream().forEach(storageRequest -> {
			Storage storage = storageService.getStorageFromStorageRequest(storageRequest);
			results.add(storageService.saveStorage(storage).getId());
		});

		return results;

	}
}
