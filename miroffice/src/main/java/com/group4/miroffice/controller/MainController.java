package com.group4.miroffice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.group4.miroffice.config.ProjectService;
import com.group4.miroffice.dto.ProjectDto;

@Controller
public class MainController {

	@Autowired
	ProjectService projectService;
	
	@GetMapping("/main")
	public String main(Model m) {
		
		List<ProjectDto> projectList = projectService.projectList();
		
		
		m.addAttribute("projectList", projectList);
		
		
		System.out.println("main 요청입니다.");
		return "main";
	}
}
