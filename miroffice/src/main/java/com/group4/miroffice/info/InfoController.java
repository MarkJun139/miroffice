package com.group4.miroffice.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group4.miroffice.dto.UserUpdateDto;
import com.group4.miroffice.user.Users;

@Controller
@RequestMapping("/main")
public class InfoController {
	
	@Autowired
	private InfoService service;
	
	@GetMapping("/info")
	public String InfoProfile(@AuthenticationPrincipal User user, Model m) {
		
		String empname = user.getUsername();
		
		Users users = service.Profile(empname);
		
		m.addAttribute("user", users);
		
		return "info";
	}
	
	@GetMapping("/check")
	public String Password() {
		
		return "check";
	}
	
	@PostMapping("/check")
	public String PasswordCheck(@AuthenticationPrincipal User user, @ModelAttribute Users password) {
		
		String empname = user.getUsername();
		
		Users users = service.Profile(empname);
		
		boolean access = service.PasswordCheck(users, password);
		
		if(access == true) {
			return "update";
		}
		
		return "check";
	}
	
	
	@GetMapping("/update")
	public String UpdatePage(@AuthenticationPrincipal User user, Model m) {
		
		String empname = user.getUsername();
		
		Users users = service.Profile(empname);
		
		m.addAttribute("user", users);
		
		return "update";
	}
	
	@PostMapping("/update")
	public String InfoUpdate(@ModelAttribute UserUpdateDto userUpdateDto, @AuthenticationPrincipal User user) {
		
		Users userUpdate = new Users();
		userUpdate.setEmpPhone(userUpdateDto.getEmpPhone());
	    userUpdate.setEmpAddress(userUpdateDto.getEmpAddress());
	    userUpdate.setEmpAddress2(userUpdateDto.getEmpAddress2());
	    userUpdate.setEmpEmail(userUpdateDto.getEmpEmail());
	    userUpdate.setEmpPhoto(userUpdateDto.getEmpPhoto());
	    userUpdate.setEmpPw(userUpdateDto.getEmpPw());
	    
	    service.InfoUpdate(userUpdate);
		
		return "redirect:/";
	}

	
	
}
