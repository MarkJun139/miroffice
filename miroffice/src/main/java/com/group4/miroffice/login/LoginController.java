package com.group4.miroffice.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class LoginController {

	@GetMapping("/")
	public String index() {
		System.out.println("로그인 성공");
		return "login2";
	}
}
