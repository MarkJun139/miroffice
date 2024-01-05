package com.group4.miroffice.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group4.miroffice.dto.Users;

@Controller
@RequestMapping("/main")
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	@GetMapping("/info")
	public String infoProfile(@AuthenticationPrincipal User user, Model m) {
		
		String empname = user.getUsername();
		
		Users users = service.Profile(empname);
		
		m.addAttribute("user", users);
		
		return "info";
	}
	
	@GetMapping("/check")
	public String infoCheck() {
		
		return "check";
	}
	
	
}
