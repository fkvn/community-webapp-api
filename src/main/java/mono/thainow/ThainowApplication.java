package mono.thainow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// for starter dependency when haven't configured database yet
//@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class,
////		HibernateJpaAutoConfiguration.class, 
//		MongoAutoConfiguration.class })
public class ThainowApplication {

	public static void main(String[] args) {
		SpringApplication.run(ThainowApplication.class, args);
	}
	
//	@Bean
//	public boolean createTestIndex(RestHighLevelClient restHighLevelClient) throws Exception {
//		try {
//			DeleteIndexRequest deleteIndexRequest = new DeleteIndexRequest("m-world");
//			restHighLevelClient.indices().delete(deleteIndexRequest, RequestOptions.DEFAULT); // 1
//		} catch (Exception ignored) {
//		}
//
//		CreateIndexRequest createIndexRequest = new CreateIndexRequest("hello-world");
//		createIndexRequest.settings(
//				Settings.builder().put("index.number_of_shards", 1)
//						.put("index.number_of_replicas", 0));
//		restHighLevelClient.indices().create(createIndexRequest, RequestOptions.DEFAULT); // 2
//
//		return true;
//	}
}
