package mono.thainow.rest.controller;

import mono.thainow.annotation.AuthenticatedAccess;
import mono.thainow.domain.storage.FirebaseRealtime;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/storages")
@AuthenticatedAccess
public class StorageController {

    @Autowired
    StorageService storageService;

    @Autowired
    FirebaseRealtime fbRealtimeDb;

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public String uploadStorage(@RequestParam("file") MultipartFile file) {
        return storageService.upload(file);
    }

    //    @PostMapping("/multiple")
    //    @ResponseStatus(HttpStatus.CREATED)
    //    public List<StorageResponse> uploadMultipleStorage(
    //            @RequestParam("files") MultipartFile[] files) {
    //
    //        List<StorageResponse> results = new ArrayList<>();
    //
    //        Arrays.asList(files).stream().forEach(file -> {
    //            results.add(storageService.upload(file));
    //        });
    //
    //        return results;
    //    }

    @PostMapping("/save")
    @ResponseStatus(HttpStatus.CREATED)
    public Long saveStorage(@RequestBody StorageRequest storageRequest) {
        return storageService.saveStorage(storageService.fetchStorageFromRequest(storageRequest))
                .getId();
    }

    @PostMapping("/save/multiple")
    @ResponseStatus(HttpStatus.CREATED)
    public List<Long> saveMultipleStorage(@RequestBody List<StorageRequest> storageRequests) {

        List<Long> results = new ArrayList<>();

        storageRequests.stream().forEach(storageRequest -> {
            Storage storage = storageService.fetchStorageFromRequest(storageRequest);
            results.add(storageService.saveStorage(storage).getId());
        });

        return results;

    }
}
