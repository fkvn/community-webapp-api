package mono.thainow.rest.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.firebase.database.DatabaseReference;

import mono.thainow.domain.storage.FirebaseRealtime;
import mono.thainow.domain.user.User;
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
	public Map<String, Object> uploadStorage(@RequestParam("file") MultipartFile file) {
		
		Map<String, Object> temp = new HashMap<>();
		
		temp = storageService.upload(file);
		
//		DatabaseReference usersRef = fbRealtimeDb.getRef().child("storages");
//
//		temp.put("alanisawesome", "test");
//		temp.put("gracehop","test2");
//
//		usersRef.setValueAsync(temp);
		
		return temp;
//        return storageService.upload(file);
	}
}
