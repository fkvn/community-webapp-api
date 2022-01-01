package mono.thainow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.mongo.MongoAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;

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
