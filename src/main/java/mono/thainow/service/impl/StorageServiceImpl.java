package mono.thainow.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import mono.thainow.dao.StorageDao;
import mono.thainow.domain.storage.Storage;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.rest.response.StorageResponse;
import mono.thainow.service.FirebaseService;
import mono.thainow.service.StorageService;

@Service
public class StorageServiceImpl implements StorageService {

	@Autowired
	private FirebaseService firebaseService;

	@Autowired
	StorageDao storageDao;

	@Override
	public StorageResponse upload(MultipartFile multipartFile) {

		String fileName = getFileName(multipartFile);

		// to convert multipartFile to File
		File file = convertToFile(multipartFile, fileName);

		// to get uploaded file link
		String TEMP_URL = uploadFile(file, fileName, multipartFile.getContentType());

		file.delete();

//		return full storage object
		StorageResponse storageResponse = new StorageResponse();

		storageResponse.setName(fileName);
		storageResponse.setType(multipartFile.getContentType());
		storageResponse.setUrl(TEMP_URL);
		storageResponse.setSize(multipartFile.getSize());

		return storageResponse;
	}

	@Override
	public String getFileName(MultipartFile file) {

		String fileName = file.getOriginalFilename(); // to get original file name

		// generate a unique file name
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

		String dowloadUrl = firebaseService.uploadFile(file, fileName, fileType);

		return dowloadUrl;
	}

	@Override
	public Storage saveStorage(Storage storage) {
		return storageDao.saveStorage(storage);
	}

	@Override
	public Storage getStorage(Long id) {
		return storageDao.getStorage(id);
	}

	@Override
	public Storage getStorage(String fileName) {
		return storageDao.getStorage(fileName);
	}

	@Override
	public Storage getStorageFromUrl(String url) {
		return storageDao.getStorageFromUrl(url);
	}

	@Override
	public Storage getStorageFromStorageRequest(StorageRequest req) {
		Storage storage = new Storage();

		storage.setName(req.getName());
		storage.setType(req.getType());
		storage.setUrl(req.getUrl());
		storage.setSize(req.getSize());

		return storage;
	}

	@Override
	public List<Storage> getStoragesFromStorageRequests(List<StorageRequest> reqs) {

		List<Storage> coverPictures = new ArrayList<>();

		if (reqs != null && reqs.size() > 0) {

			reqs.forEach(req -> {
//				check if the image is already existed
				Storage picture = getStorageFromUrl(req.getUrl());

//				not existed
				if (picture == null) {
					picture = getStorageFromStorageRequest(req);
					picture = saveStorage(picture);
				}

//				add to new list
				coverPictures.add(picture);
			});
		}

		if (coverPictures.size() == 0) {
			return null;
		}

		return coverPictures;

	}

}
