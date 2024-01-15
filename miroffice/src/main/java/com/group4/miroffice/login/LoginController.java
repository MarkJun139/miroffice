package com.group4.miroffice.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/")
	public String index() {
		return "login2";
	}

	void test() {
	}
}
