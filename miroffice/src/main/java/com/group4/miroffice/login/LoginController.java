package com.group4.miroffice.login;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

	@GetMapping("/login")
	void title() {
	}

	@PostMapping("/login")
	public String login(@PathVariable("emp_no") int userId, @PathVariable("emp_pw") String password, ModelMap m) {
		m.addAttribute("emp_no", userId);
		m.addAttribute("emp_pw", password);
		return "/main";
	}

}
