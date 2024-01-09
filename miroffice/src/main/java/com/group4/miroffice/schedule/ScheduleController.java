package com.group4.miroffice.schedule;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired
	ScheduleService service;

	@GetMapping // 기본 페이지 표시
	public String viewCalendar(Model m) {
		List<Map<String, Object>> schedule = service.mainSchedule();
		Gson gson = new Gson();
		String json = gson.toJson(schedule);
		m.addAttribute("schedule", json);
		// System.out.println(json);
		return "schedule/schedule";
	}

	@PostMapping("/test")
	@ResponseBody
	public String newSchedule(@RequestParam(value = "title", defaultValue = "default") String title) {
		System.out.println("title : " + title);
		return "test";
	}
}
