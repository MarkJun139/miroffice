package com.group4.miroffice.login;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.group4.miroffice.config.SecurityUser;
import com.group4.miroffice.user.Users;


@Controller
public class LoginController {

	@GetMapping("/")
	public String index2() {
		return "redirect:/login";
	}
	
	@GetMapping("/login")
	public String index() {
		System.out.println("index 요청입니다.");
		return "login2";
	}
	

	
//	@GetMapping("/main")
//	public String main() {
//		System.out.println("main 요청입니다.");
//		return "main";
//	}

//	@GetMapping("/member")
//	public String forMember() {
//		System.out.println("Member 요청입니다.");
//		return "test/member";
//	}
//
//	@GetMapping("/teamleader")
//	public String forManager() {
//		System.out.println("Manager 요청입니다.");
//		return "test/teamleader";
//	}
//
//	@GetMapping("/admin")
//	public String forAdmin() {
//		System.out.println("Admin 요청입니다.");
//		return "test/admin";
//	}
//
//	@GetMapping("/login")
//	public String login() {
//		System.out.println("login 요청입니다.");
//		return "test/login";
//	}
//
//	@GetMapping("/loginSuccess")
//	public String loginSuccess() {
//		return "test/loginSuccess";
//	}
//	
//	@GetMapping("/accessDenied")
//	public String accessDenied() {
//		return "test/accessDenied";
//	}
//
//
//	@GetMapping("/login2")
//	public String logi2n() {
//		return "login2";
//	}

}
