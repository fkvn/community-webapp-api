package mono.thainow.configuration;

import mono.thainow.security.jwt.AuthEntryPointJwt;
import mono.thainow.security.jwt.AuthTokenFilter;
import mono.thainow.service.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(
        // securedEnabled = true,
        // jsr250Enabled = true,
        prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    //	---------- oidc ---------------
    //	@Override
    //	protected void configure(HttpSecurity http) throws Exception {
    //
    //		http.csrf().disable().cors().and().authorizeRequests()
    ////					.antMatchers(HttpMethod.GET, "/api/**").permitAll()
    ////					.antMatchers(HttpMethod.POST, "/api/**").permitAll()
    //				.antMatchers(HttpMethod.GET, "/**").hasAuthority("post-service").antMatchers
    //				(HttpMethod.POST, "/**")
    //				.hasAuthority("post-service").antMatchers(HttpMethod.PUT, "/**").hasAuthority
    //				("post-service")
    //				.antMatchers(HttpMethod.PATCH, "/**").hasAuthority("post-service").antMatchers
    //				(HttpMethod.DELETE, "/**")
    //				.hasAuthority("post-service").anyRequest().authenticated().and()
    //				.oauth2ResourceServer().jwt()
    //				.jwtAuthenticationConverter(new JwtAuthenticationConverter() {
    //
    //					@Override
    //					protected Collection<GrantedAuthority> extractAuthorities(final Jwt jwt) {
    //
    //						@SuppressWarnings("deprecation")
    //						Collection<GrantedAuthority> authorities = super.extractAuthorities
    //						(jwt);
    //						authorities.add(new SimpleGrantedAuthority("post-service"));
    //						return authorities;
    //					}
    //				});
    //	}

    // ------------- jwt ------------
    @Autowired
    UserDetailsServiceImpl userDetailsServiceImpl;

    @Autowired
    private AuthEntryPointJwt unauthorizedHandler;

    @Override
    public void configure(AuthenticationManagerBuilder authenticationManagerBuilder)
            throws Exception {
        authenticationManagerBuilder.userDetailsService(userDetailsServiceImpl)
                .passwordEncoder(passwordEncoder());
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    // ignore swagger
    @Override
    public void configure(WebSecurity web) throws Exception {

        web.ignoring().mvcMatchers("/swagger-ui/**", "/swagger-ui.html/**", "/configuration/**",
                "/swagger-resources/**", "/v2/api-docs");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable().exceptionHandling()
                .authenticationEntryPoint(unauthorizedHandler).and().sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().authorizeRequests()
                .antMatchers("/api/**").permitAll().anyRequest().authenticated();
        //		.antMatchers("/api/**").permitAll()

        http.addFilterBefore(authenticationJwtTokenFilter(),
                UsernamePasswordAuthenticationFilter.class);
    }

    @Bean
    public AuthTokenFilter authenticationJwtTokenFilter() {
        return new AuthTokenFilter();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //	cors
    @Bean
    public WebMvcConfigurer corsConfigure() {
        return new WebMvcConfigurer() {

            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**").allowedOrigins("*").allowedMethods("*")
                        .exposedHeaders("Content-Disposition");
            }
        };
    }

}
