package mono.thainow;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
// for starter dependency when haven't configured database yet
//@EnableAutoConfiguration(exclude = { DataSourceAutoConfiguration.class,
////		HibernateJpaAutoConfiguration.class, 
//		MongoAutoConfiguration.class })
@Configuration
@EnableSwagger2
public class ThainowApplication {

	public static void main(String[] args) {
		SpringApplication.run(ThainowApplication.class, args);
	}
	
	@Bean 
	public Docket productApi() {

		return new Docket(DocumentationType.SWAGGER_2).select()
				.apis(RequestHandlerSelectors.basePackage("mono.thainow.rest.controller"))
				.paths(PathSelectors.any()).build();
	}
}
