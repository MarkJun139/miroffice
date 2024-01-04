package com.group4.miroffice.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.group4.miroffice.config.ProjectService;
import com.group4.miroffice.dto.ProjectDto;

@Controller
public class ProjectController {
	
	@Autowired
	ProjectService service;
	
	@GetMapping("/projectlist")
	public String projectList(Model m) {
		
		List<ProjectDto> projectList = service.projectList();
		m.addAttribute("projectList",projectList);
		
		return "project/list";
	}
	
	@GetMapping("/projectwrite")
	public String projectWriteForm() {
		return "project/write";
	}
	
	@PostMapping("/project/write")
	public String projectWrite(ProjectDto dto) {
		
		service.projectWrite(dto);
		
		return "redirect:/projectlist";
	}
	

	
	
}
