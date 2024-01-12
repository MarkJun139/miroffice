package com.group4.miroffice.schedule;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
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

	@PostMapping("/insert")
	@ResponseBody
	public String newSchedule(@RequestParam(value = "title", defaultValue = "default") String title,
			@RequestParam(value = "start", defaultValue = "default") String start,
			@RequestParam(value = "end", defaultValue = "default") String end,
			@RequestParam(value = "allDay", defaultValue = "true") boolean allDay,
			@RequestParam(value = "color", defaultValue = "default") String color) {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String newStart = sdf.format(start);
//		String newEnd = sdf.format(end);
		Map<String, Object> newSchedule = new HashMap<>();
		newSchedule.put("title", title);
		newSchedule.put("start", start);
		newSchedule.put("end", end);
		newSchedule.put("allDay", allDay);
		newSchedule.put("color", color);
		System.out.println("insert: " + newSchedule);
		service.insertSchedule(newSchedule);
		return "insert";
	}

	@PatchMapping("/update")
	@ResponseBody
	public String updateSchedule(@RequestParam(value = "title", defaultValue = "default") String title,
			@RequestParam(value = "start", defaultValue = "default") String start,
			@RequestParam(value = "end", defaultValue = "default") String end,
			@RequestParam(value = "allDay", defaultValue = "true") boolean allDay,
			@RequestParam(value = "color", defaultValue = "default") String color) {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String newStart = sdf.format(start);
//		String newEnd = sdf.format(end);
		Map<String, Object> upSchedule = new HashMap<>();
		upSchedule.put("title", title);
		upSchedule.put("start", start);
		upSchedule.put("end", end);
		upSchedule.put("allDay", allDay);
		upSchedule.put("color", color);
		System.out.println("update: " + upSchedule);
		service.updateSchedule(upSchedule);
		return "update";
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public String deleteSchedule(@RequestParam(value = "title", defaultValue = "default") String title,
			@RequestParam(value = "start", defaultValue = "default") Date start) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String newStart = sdf.format(start);
		Map<String, Object> delSchedule = new HashMap<>();
		delSchedule.put("title", title);
		delSchedule.put("start", newStart);
		System.out.println("delete: " + delSchedule);
		service.deleteSchedule(delSchedule);
		return "delete";
	}
}