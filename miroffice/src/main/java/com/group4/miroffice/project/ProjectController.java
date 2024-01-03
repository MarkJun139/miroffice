package com.group4.miroffice.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProjectController {
	
	
	@GetMapping("/projectlist")
	public String projectList() {
		return "project/list";
	}
	@GetMapping("/main")
	public String main() {
		return "main";
	}
}
