package com.group4.miroffice.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
public class SecurityConfig {	
	
	@Autowired
	private BoardUserDetailsService boardUserDetailsService;
	
	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

				http.csrf(AbstractHttpConfigurer::disable)
		
				.headers((headers) -> headers.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable))

				.authorizeHttpRequests(auth -> {
					try {
						auth.requestMatchers(new AntPathRequestMatcher("/member/**"),
								new AntPathRequestMatcher("/js/**")).authenticated()
								.requestMatchers(new AntPathRequestMatcher("/admin/**")).hasRole("ADMIN")
								.requestMatchers(new AntPathRequestMatcher("/teamleader/**")).hasAnyRole("TEAMLEADER", "ADMIN")
								.anyRequest().permitAll()

								.and().formLogin().loginPage("/login").defaultSuccessUrl("/loginSuccess", true)
								.and().exceptionHandling().accessDeniedPage("/accessDenied")
								.and().logout().invalidateHttpSession(true).logoutSuccessUrl("/login");
				
						
					} catch (Exception e) {
						e.printStackTrace();
					}
				}

				);
				http.userDetailsService(boardUserDetailsService);

		return http.build();

	}
	
	@Bean 
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
/*	
	@Autowired
	public void authenticate(AuthenticationManagerBuilder auth) throws Exception{
		auth.inMemoryAuthentication().withUser("manager")
		.password("{noop}manager123")
		.roles("MANAGER");
		
		auth.inMemoryAuthentication().withUser("admin")
		.password("{noop}admin123")
		.roles("ADMIN");
	}
*/
}