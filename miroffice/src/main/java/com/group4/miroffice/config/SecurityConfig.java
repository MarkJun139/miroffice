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
	private LoginUserDetailsService boardUserDetailsService;

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

		http.csrf(AbstractHttpConfigurer::disable)


		.headers((headers) -> headers.frameOptions(HeadersConfigurer.FrameOptionsConfig::disable))
		
		.authorizeHttpRequests(auth -> {
			try {
				auth.requestMatchers(new AntPathRequestMatcher("/main/**")).authenticated()
						.requestMatchers(new AntPathRequestMatcher("/main/admin/**")).hasRole("ADMIN")
						.requestMatchers(new AntPathRequestMatcher("/main/teamleader/**")).hasRole("TEAMLEADER")
						.anyRequest().permitAll();
						
	
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		).formLogin((formLogin) -> formLogin.loginPage("/login").defaultSuccessUrl("/main", true)
		).logout((logout) -> logout.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.invalidateHttpSession(true).logoutSuccessUrl("/main"))
 		.exceptionHandling((exception)-> exception.accessDeniedPage("/accessDenied"));


		http.rememberMe() // rememberMe(아이디 저장) 기능
			.key("key")
			.rememberMeParameter("remember-me")
			.tokenValiditySeconds(86400)
			.alwaysRemember(false)
			.userDetailsService(boardUserDetailsService);

		return http.build();

	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return PasswordEncoderFactories.createDelegatingPasswordEncoder();
	}
}
