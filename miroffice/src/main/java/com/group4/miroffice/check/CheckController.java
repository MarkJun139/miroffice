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

		int y = checkdate.getCheckWorkTime();

		int H = (y / 60) / 60;

		int M = ((y / 60) % 60) * 60;

		LocalTime checkTime = LocalTime.of(H, M, 00);

		List<CheckDate> weekCheck = new ArrayList<>();

		List<LocalTime> weekWorkTime = new ArrayList<>();

		for (int i = 1; i < 5; i++) {

			DayCheck day = new DayCheck();

			day.setEmpNo(empNo);
			day.setCheckDate(currentDate);
			day.setCheckMonthStart(startDate);
			day.setWeek(i);

			CheckDate day2 = service2.weekCheck(day);

			int u = day2.getCheckWorkTime();

			int Hour = (u / 60) / 60;

			int Minute = ((u / 60) % 60) * 60;

			LocalTime time = LocalTime.of(Hour, Minute, 00);

			weekWorkTime.add(time);
			weekCheck.add(day2);

		}

		List<String> searchEmp = service2.searchEmp(users.getDeptNo());

		Checkout checkout = service2.checkout(dayCheck);

		LocalTime start = checkout.getCheckStartTime();
		LocalTime end = checkout.getCheckEndTime();

		m.addAttribute("start", start);
		m.addAttribute("end", end);
		m.addAttribute("searchEmp", searchEmp);
		m.addAttribute("user", users);
		m.addAttribute("checkdate", checkdate);
		m.addAttribute("checkTime", checkTime);
		m.addAttribute("first", weekCheck.get(0));
		m.addAttribute("second", weekCheck.get(1));
		m.addAttribute("third", weekCheck.get(2));
		m.addAttribute("four", weekCheck.get(3));
		m.addAttribute("firstTime", weekWorkTime.get(0));
		m.addAttribute("secondTime", weekWorkTime.get(1));
		m.addAttribute("thirdTime", weekWorkTime.get(2));
		m.addAttribute("fourTime", weekWorkTime.get(3));

		return "check/checkout";

	}

	@GetMapping("/start")
	public String Start(@AuthenticationPrincipal User user) {

		LocalDate currentDate = LocalDate.now();

		LocalTime currentTime = LocalTime.now();

		LocalTime time = LocalTime.of(9, 00, 00);

		String empNo = user.getUsername();

		Users users = service.Profile(empNo);
		
		DayCheck dayCheck = new DayCheck();

		dayCheck.setEmpNo(empNo);
		dayCheck.setCheckDate(currentDate);
		
		Checkout check = service2.checkout(dayCheck);

		Checkout checkout = new Checkout();

		checkout.setEmpNo(users.getEmpNo());
		checkout.setDeptNo(users.getDeptNo());
		checkout.setCheckDate(currentDate);
		checkout.setCheckStartTime(currentTime);
		
		if(check.getCheckDate() == null) {
			
			if (currentTime.isBefore(time)) {
				service2.start(checkout);
			} else {
				service2.lateStart(checkout);
			}
			
		}
			
		
		
		return "redirect:/main/checkout";
	}

	@GetMapping("/end")
	public String End(@AuthenticationPrincipal User user) {

		LocalDate currentDate = LocalDate.now();

		LocalTime currentTime = LocalTime.now();
		
		LocalTime time = LocalTime.of(18, 00, 00);

		String empNo = user.getUsername();

		Users users = service.Profile(empNo);

		Checkout checkout = new Checkout();

		checkout.setEmpNo(users.getEmpNo());
		checkout.setDeptNo(users.getDeptNo());
		checkout.setCheckDate(currentDate);
		checkout.setCheckEndTime(currentTime);
		
		if (currentTime.isBefore(time)) {
			service2.earlyEnd(checkout);
		} else {
			service2.end(checkout);
		}

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

		int y = checkdate.getCheckWorkTime();

		int H = (y / 60) / 60;

		int M = ((y / 60) % 60) * 60;

		LocalTime checkTime = LocalTime.of(H, M, 00);

		List<CheckDate> weekCheck = new ArrayList<>();
		
		List<LocalTime> weekWorkTime = new ArrayList<>();

		for (int i = 1; i < 5; i++) {

			DayCheck day = new DayCheck();

			day.setEmpNo(Integer.toString(users.getEmpNo()));
			day.setCheckDate(currentDate);
			day.setCheckMonthStart(startDate);
			day.setWeek(i);

			CheckDate day2 = service2.weekCheck(day);
			
			int u = day2.getCheckWorkTime();

			int Hour = (u / 60) / 60;

			int Minute = ((u / 60) % 60) * 60;

			LocalTime time = LocalTime.of(Hour, Minute, 00);

			weekWorkTime.add(time);

			weekCheck.add(day2);

		}

		List<String> searchEmp = service2.searchEmp(users.getDeptNo());

		m.addAttribute("searchEmp", searchEmp);
		m.addAttribute("user", users);
		m.addAttribute("checkdate", checkdate);
		m.addAttribute("checkTime", checkTime);
		m.addAttribute("first", weekCheck.get(0));
		m.addAttribute("second", weekCheck.get(1));
		m.addAttribute("third", weekCheck.get(2));
		m.addAttribute("four", weekCheck.get(3));
		m.addAttribute("firstTime", weekWorkTime.get(0));
		m.addAttribute("secondTime", weekWorkTime.get(1));
		m.addAttribute("thirdTime", weekWorkTime.get(2));
		m.addAttribute("fourTime", weekWorkTime.get(3));

		return "check/leaderCheck";
	}
	
	@GetMapping("/main/halfoff")
	public String halfoff() {
		return "redirect:/main/checkout";
	}

}
