package com.group4.miroffice.check;

import java.time.LocalDate;
import java.time.LocalTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.group4.miroffice.dto.Checkout;
import com.group4.miroffice.dto.DayCheck;
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

		LocalDate currentDate = LocalDate.now();

		String empNo = user.getUsername();

		Users users = service.Profile(empNo);

		DayCheck dayCheck = new DayCheck();

		dayCheck.setEmpNo(empNo);
		dayCheck.setCheck_date(currentDate);

		Checkout checkout = service2.Check(dayCheck);

		m.addAttribute("checkout", checkout);

		return "check/checkout";

	}

	@GetMapping("/start")
	public String Start(@AuthenticationPrincipal User user) {

		LocalDate currentDate = LocalDate.now();

		LocalTime currentTime = LocalTime.now();

		LocalTime time = LocalTime.of(9, 00, 00);

		String empNo = user.getUsername();

		Users users = service.Profile(empNo);

		Checkout checkout = new Checkout();

		checkout.setEmp_no(users.getEmpNo());
		checkout.setDept_no(users.getDeptNo());
		checkout.setCheck_date(currentDate);
		checkout.setCheck_start_time(currentTime);

		if (currentTime.isBefore(time)) {

			service2.Start(checkout);

		} else {

			service2.LateStart(checkout);

		}

		return "redirect:/main/checkout";
	}

	@GetMapping("/end")
	public String End(@AuthenticationPrincipal User user) {

		LocalDate currentDate = LocalDate.now();

		LocalTime currentTime = LocalTime.now();

		String empNo = user.getUsername();

		Users users = service.Profile(empNo);

		Checkout checkout = new Checkout();

		checkout.setEmp_no(users.getEmpNo());
		checkout.setDept_no(users.getDeptNo());
		checkout.setCheck_date(currentDate);
		checkout.setCheck_end_time(currentTime);

		service2.End(checkout);

		return "redirect:/main/checkout";
	}

}
