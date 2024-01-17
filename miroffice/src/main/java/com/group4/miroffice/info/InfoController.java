package com.group4.miroffice.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group4.miroffice.dto.Dept;
import com.group4.miroffice.user.Users;

@Controller
@RequestMapping("/main")
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	@GetMapping("/info")
	public String InfoProfile(@AuthenticationPrincipal User user, Model m) {
		
		String empNo = user.getUsername();
		
		Users users = service.Profile(empNo);
		
		Dept dept = service.Dept(users.getDeptNo());
		
		m.addAttribute("user", users);
		
		m.addAttribute("dept", dept);
		
		return "info/info";
	}
	
	@GetMapping("/check")
	public String Password() {
		
		return "info/check";
	}
	
	@PostMapping("/check")
	public String PasswordCheck(@AuthenticationPrincipal User user, @RequestParam("password") String password) {
		
		String empname = user.getUsername();
		
		Users users = service.Profile(empname);
		
		if(!users.getEmpPw().equals(password)) {
			
			return "info/check";
		}
		
		return "redirect:/main/update";
	}
	
	
	@GetMapping("/update")
	public String UpdatePage(@AuthenticationPrincipal User user, Model m) {
		
		String empname = user.getUsername();
		
		Users users = service.Profile(empname);
		
		m.addAttribute("user", users);
		
		return "info/update";
	}
	

//	@PostMapping("/update")
//
//	public String InfoUpdate(@ModelAttribute UserUpdateDto userUpdateDto) {
//		
//		Users userUpdate = new Users();
//		
//
//		service.InfoUpdate(userUpdate);
//			
//		return "redirect:/main";
//	}

	
	
}
