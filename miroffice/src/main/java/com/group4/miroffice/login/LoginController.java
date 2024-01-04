package com.group4.miroffice.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class LoginController {

	@GetMapping("/")
	public String index() {
		System.out.println("index 요청입니다.");
		return "test/index";
	}

	@GetMapping("/member")
	public String forMember() {
		System.out.println("Member 요청입니다.");
		return "test/member";
	}

	@GetMapping("/teamleader")
	public String forManager() {
		System.out.println("Manager 요청입니다.");
		return "test/teamleader";
	}

	@GetMapping("/admin")
	public String forAdmin() {
		System.out.println("Admin 요청입니다.");
		return "test/admin";
	}

	@GetMapping("/login")
	public String login() {
		System.out.println("login 요청입니다.");
		return "test/login";
	}

	@GetMapping("/loginSuccess")
	public String loginSuccess() {
		return "test/loginSuccess";
	}

}
