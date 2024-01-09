package com.group4.miroffice.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;
import com.group4.miroffice.dto.Schedule;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	ScheduleService service;

	@RequestMapping //기본 페이지 표시
	@GetMapping
	public String viewCalendar(Model m){
		List<Map<String, Object>> schedule = service.mainSchedule();
		Gson gson = new Gson();
		String json = gson.toJson(schedule);
		m.addAttribute("schedule",  json);
		System.out.println(json);
		return "schedule/schedule";
	}
	
//	@GetMapping("/event")
//	public @ResponseBody List<Map<String, Object>> getSchedule(){
//		System.out.println(service.mainSchedule());
//		return service.mainSchedule();
//	}
}
