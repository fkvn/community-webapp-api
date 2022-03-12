package mono.thainow;

import java.util.Collection;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;

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
	
	@EnableWebSecurity
	@Configuration
	class WebSecurityConfig extends WebSecurityConfigurerAdapter {

		@Override
		protected void configure(HttpSecurity http) throws Exception {
			
			http.csrf().disable().cors().and().authorizeRequests() 
//					.antMatchers(HttpMethod.GET, "/api/**").permitAll()
//					.antMatchers(HttpMethod.POST, "/api/**").permitAll()
					.antMatchers(HttpMethod.GET, "/**").hasAuthority("post-service")
					.antMatchers(HttpMethod.POST, "/**").hasAuthority("post-service")
					.antMatchers(HttpMethod.PUT, "/**").hasAuthority("post-service")
					.antMatchers(HttpMethod.PATCH, "/**").hasAuthority("post-service")
					.antMatchers(HttpMethod.DELETE, "/**").hasAuthority("post-service")
					.anyRequest()
					.authenticated().and().oauth2ResourceServer().jwt()
					.jwtAuthenticationConverter(new JwtAuthenticationConverter() {

						@Override
						protected Collection<GrantedAuthority> extractAuthorities(final Jwt jwt) {

							@SuppressWarnings("deprecation")
							Collection<GrantedAuthority> authorities = super.extractAuthorities(jwt);
//							List<String> scopes = jwt.getClaimAsStringList("scope");
//							if (scopes != null && scopes.contains("alice-survey-service-api"))// check if user has
//																																								// the scope																														// survey-service
//							{
//								authorities.add(new SimpleGrantedAuthority("survey-service"));
//							}
							authorities.add(new SimpleGrantedAuthority("post-service"));
							return authorities;
						}
					});

		}
	}

}
