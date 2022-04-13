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
	
}
