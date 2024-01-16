package com.group4.miroffice.check;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group4.miroffice.dto.CheckDate;
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

		String empNo = user.getUsername();

		Users users = service.Profile(empNo);

		LocalDate currentDate = LocalDate.now();

		LocalDate startDate = LocalDate.now().withDayOfMonth(1);

		DayCheck dayCheck = new DayCheck();

		dayCheck.setEmpNo(empNo);
		dayCheck.setCheckDate(currentDate);
		dayCheck.setCheckMonthStart(startDate);

		CheckDate checkdate = service2.checkdate(dayCheck);

		List<CheckDate> weekCheck = new ArrayList<>();

		for (int i = 1; i < 5; i++) {

			DayCheck day = new DayCheck();

			day.setEmpNo(empNo);
			day.setCheckDate(currentDate);
			day.setCheckMonthStart(startDate);
			day.setWeek(i);

			CheckDate day2 = service2.weekCHeck(day);

			weekCheck.add(day2);

		}

		List<String> searchEmp = service2.searchEmp(users.getDeptNo());
		
		List<Checkout> checkout = service2.checkout(dayCheck);
		
		LocalTime start = checkout.get(0).getCheckStartTime();
		LocalTime end = checkout.get(0).getCheckEndTime();
		
		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("searchEmp", searchEmp);
		m.addAttribute("user", users);
		m.addAttribute("checkdate", checkdate);
		m.addAttribute("first", weekCheck.get(0));
		m.addAttribute("second", weekCheck.get(1));
		m.addAttribute("third", weekCheck.get(2));
		m.addAttribute("four", weekCheck.get(3));

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

		checkout.setEmpNo(users.getEmpNo());
		checkout.setDeptNo(users.getDeptNo());
		checkout.setCheckDate(currentDate);
		checkout.setCheckStartTime(currentTime);

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

		checkout.setEmpNo(users.getEmpNo());
		checkout.setDeptNo(users.getDeptNo());
		checkout.setCheckDate(currentDate);
		checkout.setCheckEndTime(currentTime);

		service2.End(checkout);

		return "redirect:/main/checkout";
	}

	@GetMapping("/checkout/teamleader")
	public String LeaderCheck(@RequestParam("empName") String empName, Model m) {

		Users users = service2.leaderCheck(empName);

		LocalDate currentDate = LocalDate.now();

		LocalDate startDate = LocalDate.now().withDayOfMonth(1);

		DayCheck dayCheck = new DayCheck();

		dayCheck.setEmpNo(Integer.toString(users.getEmpNo()));
		dayCheck.setCheckDate(currentDate);
		dayCheck.setCheckMonthStart(startDate);

		CheckDate checkdate = service2.checkdate(dayCheck);

		List<CheckDate> weekCheck = new ArrayList<>();

		for (int i = 1; i < 5; i++) {

			DayCheck day = new DayCheck();

			day.setEmpNo(Integer.toString(users.getEmpNo()));
			day.setCheckDate(currentDate);
			day.setCheckMonthStart(startDate);
			day.setWeek(i);

			CheckDate day2 = service2.weekCHeck(day);

			weekCheck.add(day2);

		}

		List<String> searchEmp = service2.searchEmp(users.getDeptNo());

		m.addAttribute("searchEmp", searchEmp);
		m.addAttribute("user", users);
		m.addAttribute("checkdate", checkdate);
		m.addAttribute("first", weekCheck.get(0));
		m.addAttribute("second", weekCheck.get(1));
		m.addAttribute("third", weekCheck.get(2));
		m.addAttribute("four", weekCheck.get(3));

		return "check/leaderCheck";
	}

}
