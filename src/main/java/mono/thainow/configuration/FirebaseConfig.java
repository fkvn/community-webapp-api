package mono.thainow.configuration;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.boot.autoconfigure.AutoConfigureBefore;
import org.springframework.context.annotation.Configuration;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;

import lombok.Getter;
import mono.thainow.domain.storage.FirebaseStorageClient;

@Configuration
public class FirebaseConfig {

	public static final String SERVICE_ACCOUNT_KEY = "serviceAccountKey.json";
	
	@Getter
	public static final String DATABASE_URL = "https://mono-thainow-default-rtdb.firebaseio.com";
	
	@Getter
	public static final String STORAGE_BUCKET_URL = "mono-thainow.appspot.com";

	@SuppressWarnings("deprecation")
	@PostConstruct
	public void initialize() throws IOException {

		// Getting ClassLoader obj
		ClassLoader classLoader = this.getClass().getClassLoader();

		// Getting resource(File) from class loader
		File serviceAccountKey = new File(classLoader.getResource(SERVICE_ACCOUNT_KEY).getFile());

		// Fetch the service account key JSON file contents
		FileInputStream serviceAccount = new FileInputStream(serviceAccountKey);

		// Initialize the app with a custom auth variable, limiting the server's access
		Map<String, Object> auth = new HashMap<String, Object>();
		auth.put("root", "thainow-service-worker");

		FirebaseOptions options = new FirebaseOptions.Builder()
				.setCredentials(GoogleCredentials.fromStream(serviceAccount))
				// The database URL depends on the location of the database
				.setDatabaseUrl(DATABASE_URL)
				// The storage URL 
				.setStorageBucket(STORAGE_BUCKET_URL)
				.setDatabaseAuthVariableOverride(auth).build();

		if (FirebaseApp.getApps().isEmpty()) { // <--- check with this line
			FirebaseApp.initializeApp(options);
		}
		

	}

}
