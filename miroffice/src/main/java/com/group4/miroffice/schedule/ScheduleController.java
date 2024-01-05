package com.group4.miroffice.schedule;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ScheduleController {
	
	@GetMapping("/schedule")
	public String scheduleMain() {
		return "schedule/schedule";
	}
}
