package com.group4.miroffice.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group4.miroffice.user.Users;

import jakarta.validation.Valid;

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
	public String findIdResult(@Valid Users user, BindingResult bresult, Model m) {
		String view = "login/findidresult";
		String nameError = "";
		String phoneError = "";

		if (bresult.getFieldError("empName") != null) {
			nameError = bresult.getFieldError("empName").getDefaultMessage();
			view = "login/findid";
		}

		if (bresult.getFieldError("empPhone") != null) {
			phoneError = bresult.getFieldError("empPhone").getDefaultMessage();
			view = "login/findid";
		}
		System.out.println("nameError: " + nameError);
		System.out.println("phoneError: " + phoneError);
		m.addAttribute("nameError", nameError);
		m.addAttribute("phoneError", phoneError);
		m.addAttribute("insertName", user.getEmpName());
		m.addAttribute("insertPhone", user.getEmpPhone());
		Users result = service.findId(user);
		m.addAttribute("findid", result);
		System.out.println(result);
		return view;
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
	public String resetPwResult(@Valid Users user, BindingResult bresult, Model m) throws Exception {
		String view = "login/findpasswordresult";
		String empName = user.getEmpName();
		String empEmail = user.getEmpEmail();
		String noError = "";
		String nameError = "";
		String emailError = "";
		String empNo = user.getEmpNo() + "";
		
		String password = service.findPassword(empName, empNo, empEmail);
		if (password != null) {
			String temppw = getTempPassword();
			System.out.println("temppw: " + temppw);
			service.resetPassword(temppw, empName, empNo);
			service.sendMail(temppw, empName, empEmail);
		}

		if (bresult.getFieldError("empNo") != null) {
			noError = bresult.getFieldError("empNo").getDefaultMessage();
			view = "login/findpassword";
		}

		if (bresult.getFieldError("empName") != null) {
			nameError = bresult.getFieldError("empName").getDefaultMessage();
			view = "login/findpassword";
		}

		if (bresult.getFieldError("empEmail") != null) {
			emailError = bresult.getFieldError("empEmail").getDefaultMessage();
			view = "login/findpassword";
		}

		System.out.println("noError: " + noError);
		System.out.println("nameError: " + nameError);
		System.out.println("emailError: " + emailError);

		m.addAttribute("password", password);

		m.addAttribute("noError", noError);
		m.addAttribute("nameError", nameError);
		m.addAttribute("emailError", emailError);
		m.addAttribute("name", user.getEmpName());
		m.addAttribute("email", user.getEmpEmail());
		return view;

	}

//	@PostMapping("/findpasswordresult")
//	public String findIdResult(@RequestParam(value = "empNo") String no,
//			@RequestParam(value = "empName") String name, @RequestParam(value = "empEmail") String email, Model m)
//			throws Exception {
//		String view = "login/findpasswordresult";
//		String password = service.findPassword(name, no, email);
//		String temppw = getTempPassword();
//
//		if (password != null) {
//			service.resetPassword(temppw, name, no);
//			service.sendMail(temppw, name, email);
//		}
//
//		System.out.println("temppw: " + temppw);
//		m.addAttribute("password", password);
//		m.addAttribute("name", name);
//		m.addAttribute("email", email);
//		return view;
//
//	}

	@GetMapping("/accessdenied")
	public String accessDebied() {
		return "accessDenied";
	}

}
