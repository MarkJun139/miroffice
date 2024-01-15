package com.group4.miroffice.login;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.group4.miroffice.config.SecurityUser;
import com.group4.miroffice.user.Users;


@Controller
public class LoginController {

	
	@GetMapping("/")
	public String index2() {
		if(isAuthenticated()) {
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
}
