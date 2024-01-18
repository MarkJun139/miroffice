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

//	@GetMapping("/login")
//	public String login2() {
//		return "login2";
//	}

	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "exception", required = false) String exception, Model model) {
		model.addAttribute("error", error);
		model.addAttribute("exception", exception);
		System.out.println("error: " + error);
		System.out.println("exception: " + exception);
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
		System.out.println(result);
		return "login/findidresult";
	}

	@GetMapping("/findpassword")
	public String findPassword() {
		return "login/findpassword";
	}

	public String getTempPassword() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		String str = "";

		int idx = 0;
		for (int i = 0; i < 6; i++) {
			idx = (int) (charSet.length * Math.random());
			str += charSet[idx];
		}
		return str;
	}

	@PostMapping("/findpasswordresult")
	public String findIdResult(@RequestParam(value = "empNo") String no, @RequestParam(value = "empName") String name,
			@RequestParam(value = "empEmail") String email, Model m) throws Exception {
		String password = service.findPassword(name, no, email);
		String temppw = getTempPassword();

		if (password != null) {
			service.resetPassword(temppw, name, no);
//			service.sendMail(temppw, name, email);
		}
		System.out.println("temppw: " + temppw);

		m.addAttribute("password", password);
		m.addAttribute("name", name);
		m.addAttribute("email", email);
		return "login/findpasswordresult";

	}

	@GetMapping("/accessdenied")
	public String accessDebied() {
		return "accessDenied";
	}

}
