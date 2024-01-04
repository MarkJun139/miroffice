package com.group4.miroffice.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.group4.miroffice.login.service.LoginService;

@Controller
public class LoginController {
	
	@Autowired
	LoginService service;
	
	@GetMapping("/login")
	void title() {
	}

}
