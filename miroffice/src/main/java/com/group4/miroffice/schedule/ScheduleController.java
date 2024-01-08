package com.group4.miroffice.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	@Autowired
	ScheduleService service;
	@RequestMapping //기본 페이지 표시
	public String viewCalendar(){
		return "schedule/schedule";
	}
	
	@GetMapping("/event")
	public @ResponseBody List<Map<String, Object>> getSchedule(){
		return service.mainSchedule();
	}
}
