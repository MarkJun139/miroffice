package com.group4.miroffice.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

import jakarta.servlet.DispatcherType;

@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable().cors().disable()
                .authorizeHttpRequests(request -> request
                .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                // .requestMatchers("/findnumber","/findpassword").permitAll() // 로그인 하지 않아도 보여야 할 예외들
                .anyRequest().authenticated()	// 어떠한 요청이라도 인증필요
                )
                .formLogin(login -> login	// form 방식 로그인 사용
                .loginPage("/login") // 로그인 페이지 설정
                .usernameParameter("userId") // login.jsp 아이디 입력 name
                .passwordParameter("password") // 비밀번호 입력 name
                .defaultSuccessUrl("/main", true) // 로그인 성공 시 main으로
                .permitAll()	
                );
                /*.logout(withDefaults());	// 로그아웃은 기본설정으로 (/logout으로 인증해제)
*/
        return http.build();
}
}
