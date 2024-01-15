package com.group4.miroffice.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class LoginController {

	@Autowired
	FindIdResetPwService service;

	@GetMapping("/")
	public String index2() {
		if (isAuthenticated()) {
			return "main";
		}
		return "redirect:/login";
	}

	@GetMapping("/login")
	public String index() {
		return "login2";
	}

	private boolean isAuthenticated() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if (authentication == null || AnonymousAuthenticationToken.class.isAssignableFrom(authentication.getClass())) {
			return false;
		}
		return authentication.isAuthenticated();
	}

	@GetMapping("/findid")
	public String findId() {
		return "login/findid";
	}

	@PostMapping("/findidresult")
	public String findIdResult(@RequestParam(value = "empName") String name,
			@RequestParam(value = "empPhone") String phone, Model m) {
		
		String result = service.findId(name, phone);
		
		m.addAttribute("findid", result);

		return "login/findidresult";
	}
	public void test() {}
}
