package mono.thainow.service.impl;

import mono.thainow.configuration.ServiceEnv;
import mono.thainow.dao.StorageDao;
import mono.thainow.domain.storage.Storage;
import mono.thainow.repository.StorageRepository;
import mono.thainow.rest.request.StorageRequest;
import mono.thainow.service.FirebaseService;
import mono.thainow.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import static org.apache.commons.lang3.StringUtils.isBlank;


@Service
public class StorageServiceImpl implements StorageService {

    @Autowired
    StorageDao storageDao;
    @Autowired
    StorageRepository storageRepository;
    @Autowired
    private FirebaseService firebaseService;

    @Value("${deploy.service.env}")
    private String serviceEnv;

    @Override
    public String upload(MultipartFile multipartFile) {

        String fileName = fetchFileName(multipartFile);

        // to convert multipartFile to File
        File file = convertToFile(multipartFile, fileName);

        // to get uploaded file link
        String url = uploadFile(file, fileName, multipartFile.getContentType());

        file.delete();

        if (!isBlank(url)) {

            Storage storage = new Storage();

            storage.setName(fileName);
            storage.setType(multipartFile.getContentType());
            storage.setUrl(url);
            storage.setSize(multipartFile.getSize());

            saveStorage(storage);
        }
        return url;
    }

    @Override
    public String fetchFileName(MultipartFile file) {

        String fileName = file.getOriginalFilename(); // to get original file name

        // generate a unique file name
        fileName = UUID.randomUUID().toString().concat(this.fetchExtension(fileName));

        return fileName;
    }

    @Override
    public String fetchExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf("."));
    }

    @Override
    public File convertToFile(MultipartFile multipartFile, String fileName) {

        // Since Google App Engine uses /tmp/ folder path for temporary RAM storage
        if (serviceEnv.equalsIgnoreCase(ServiceEnv.GAE_ENV.name())) {
            fileName = "/tmp/" + fileName;
        }

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
    public void deleteStorage(Storage storage) {
        storageRepository.delete(storage);
    }

    @Override
    public Optional<Storage> findStorageById(Long id) {
        return storageRepository.findById(id);
    }

    @Override
    public Storage findStorageByName(String fileName) {
        return storageDao.findStorageByName(fileName);
    }

    @Override
    public Storage findStorageByUrl(String url) {
        return storageDao.findStorageByUrl(url);
    }

    @Override
    public Storage fetchStorageFromRequest(StorageRequest req) {
        Storage storage = new Storage();

        storage.setName(req.getName().trim());
        storage.setType(req.getType().trim());
        storage.setUrl(req.getUrl().trim());
        storage.setSize(req.getSize());

        return storage;
    }

    @Override
    public List<Storage> fetchStoragesFromRequests(List<StorageRequest> reqs) {

        List<Storage> coverPictures = new ArrayList<>();

        if (reqs != null && reqs.size() > 0) {

            reqs.forEach(req -> {
                //				check if the image is already existed
                Storage picture = findStorageByUrl(req.getUrl());

                //				not existed
                if (picture == null) {
                    picture = fetchStorageFromRequest(req);
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
