package mono.thainow.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mono.thainow.dao.StorageDao;
import mono.thainow.domain.storage.Storage;
import mono.thainow.repository.StorageRepository;

@Repository
public class StorageDaoImpl implements StorageDao {


	@PersistenceContext
	private EntityManager entityManager;
	
	@Autowired
	private StorageRepository storageRepository;
	
//	======================================================
	
	@Override
	public List<Storage> getAllStorages() {
		return storageRepository.findAll();
	}
	
	@Override
	public Storage getStorage(long id) {
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



}
