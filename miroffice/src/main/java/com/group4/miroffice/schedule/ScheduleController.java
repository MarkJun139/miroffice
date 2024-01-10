package com.group4.miroffice.schedule;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
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
	public String newSchedule(@RequestParam(value = "title", defaultValue = "default") String title,
			@RequestParam(value = "start", defaultValue = "default") Date start,
			@RequestParam(value = "end", defaultValue = "default") Date end) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newStart = sdf.format(start);
		String newEnd = sdf.format(end);
		Map<String, Object> newSchedule = new HashMap<>();
		newSchedule.put("title", title);
		newSchedule.put("start", newStart);
		newSchedule.put("end", newEnd);
		System.out.println("title: " + title + " start: " + newStart + " end: " + newEnd);
		service.insertSchedule(newSchedule);
		return "test";
	}
}
