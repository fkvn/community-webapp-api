package mono.thainow.dao;

import java.util.List;

import mono.thainow.domain.storage.Storage;

public interface StorageDao {

	public List<Storage> getAllStorages();
	
	public Storage getStorage(long id);
	
	public Storage getStorage(String fileName);

	public Storage saveStorage(Storage file);

	public void removeStorage(long id);
	
	
}
