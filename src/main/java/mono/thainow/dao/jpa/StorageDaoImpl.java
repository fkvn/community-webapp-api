package mono.thainow.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import mono.thainow.dao.StorageDao;
import mono.thainow.domain.storage.Storage;

@Repository
public class StorageDaoImpl implements StorageDao {

	@PersistenceContext
	private EntityManager entityManager;

//	======================================================

//	@Override
//	public List<Storage> getAllStorages() {
//		return storageRepository.findAll();
//	}

	@Override
	public Storage findStorageById(long id) {
		return entityManager.find(Storage.class, id);
	}

	@Override
	@Transactional
	public Storage saveStorage(Storage file) {
		return entityManager.merge(file);
	}

	@Override
	@Transactional
	public void removeStorage(long id) {
		// TODO Auto-generated method stub

	}

	@Override
	public Storage findStorageByName(String fileName) {
		try {
			Storage storage = entityManager.createQuery("from Storage where name =:name ", Storage.class)
					.setParameter("name", fileName).getSingleResult();

			return storage;
		} catch (Exception ex) {
			return null;
		}
	}

	
	@Override
	public Storage findStorageByUrl(String url) {
		try {
			Storage storage = entityManager.createQuery("from Storage where url =:url ", Storage.class)
					.setParameter("url", url).getSingleResult();

			return storage;
		} catch (Exception ex) {
			return null;
		}
	}

}
