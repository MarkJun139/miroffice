package com.group4.miroffice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.group4.miroffice.dto.Project;
import com.group4.miroffice.project.ProjectService;
import com.group4.miroffice.user.Users;

@Controller
public class MainController {

	@Autowired
	ProjectService projectService;
	
	// 메인 화면 정보
	
	@GetMapping("/main")
	public String main(Model m) {
		
		
		
		// 프로젝트 리스트 
		List<Project> projectList = projectService.projectList();
		m.addAttribute("projectList", projectList);
		
		
		System.out.println("main 요청입니다.");
		return "main";
	}

}
