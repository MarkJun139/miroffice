package com.group4.miroffice.check;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group4.miroffice.dto.Checkout;
import com.group4.miroffice.info.InfoService;
import com.group4.miroffice.user.Users;

@Controller
@RequestMapping("/main")
public class CheckController {
	
	@Autowired
	private InfoService service;
	
	@Autowired
	private CheckService service2;
	
	@GetMapping("/checkout")
	public String Approval(@AuthenticationPrincipal User user, Model m) {
		
		String empname = user.getUsername();
		
		Users users = service.Profile(empname);
		
		Checkout checkout = service2.Check(users.getEmpNo());
		
		m.addAttribute("check", checkout);
		
		return "checkout";
	}
	
}
