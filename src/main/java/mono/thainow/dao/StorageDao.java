package mono.thainow.dao;

import mono.thainow.domain.storage.Storage;

public interface StorageDao {

//	public List<Storage> getAllStorages();
	
	public Storage findStorageById(long id);
	
	public Storage findStorageByName(String fileName);

	public Storage saveStorage(Storage file);

	public void removeStorage(long id);

	public Storage findStorageByUrl(String url);
	
	
}
