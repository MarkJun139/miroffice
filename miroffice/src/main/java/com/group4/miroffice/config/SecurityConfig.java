package com.group4.miroffice.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
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
				auth.requestMatchers(new AntPathRequestMatcher("/member/**")).authenticated()
						.requestMatchers(new AntPathRequestMatcher("/admin/**")).hasRole("ADMIN")
						.requestMatchers(new AntPathRequestMatcher("/teamleader/**")).hasRole("TEAMLEADER")
						.requestMatchers(new AntPathRequestMatcher("/admin/**")).hasAnyRole("TEAMLEADER", "ADMIN")
						.anyRequest().permitAll();
						
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		).formLogin((formLogin) -> formLogin.loginPage("/").defaultSuccessUrl("/main", true)
		).logout((logout) -> logout.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.invalidateHttpSession(true).logoutSuccessUrl("/"))
 		.exceptionHandling((exception)-> exception.accessDeniedPage("/accessDenied"));

		http.userDetailsService(boardUserDetailsService);

	return http.build();

	}
	
	@Bean 
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
}

