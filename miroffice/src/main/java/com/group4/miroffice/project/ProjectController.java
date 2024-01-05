package com.group4.miroffice.project;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.group4.miroffice.config.ProjectService;
import com.group4.miroffice.dto.ProjectDto;
import com.group4.miroffice.dto.Users;

@Controller
@RequestMapping("/main")
public class ProjectController {
	
	@Autowired
	ProjectService service;

//	if (authentication != null) {
//		int empno = Integer.parseInt(authentication.getName());
//		List<Users> user = new ArrayList<Users>();
//		user = service.userInfo(empno);
//		System.out.println(user);
//		System.out.println(user.get(0).getEmpNo());
//		System.out.println(user.get(0).getDeptNo());
//		System.out.println(user.get(0).getEmpName());
//		System.out.println(user.get(0).getEmpRole());
//    }
	
	@GetMapping("/projectlist")
	public String projectList(Model m, Authentication authentication) {
		// 권한 잇는사람은 버튼 보여주기
		List<ProjectDto> projectList = service.projectList();
		m.addAttribute("projectList", projectList);
		
//		System.out.println("권한 : " + authentication.getAuthorities());
		
		return "project/list";
	}
	
	@GetMapping("/projectwrite")
	public String projectWriteForm(Authentication authentication) {
		return "project/write";
	}
	@PostMapping("/project/write")
	public String projectWrite(ProjectDto dto, Authentication authentication) {
		
		if (authentication != null) {
			int empno = Integer.parseInt(authentication.getName());
			List<Users> user = new ArrayList<Users>();
			user = service.userInfo(empno);
			
			dto.setEmpno(user.get(0).getEmpNo());
			dto.setDeptno(user.get(0).getDeptNo());
			service.projectWrite(dto);
			System.out.println("프로젝트 등록 완료");
			System.out.println("프로젝트 작성자 : " + user.get(0).getEmpName());
		} else {
			System.out.println("프로젝트 등록 실패");
			return "project/list";
		}
		return "redirect:/projectlist";
	}
	
	@GetMapping("/project/view/{id}")
	public String projectView(@PathVariable(name = "id") int id, Model m) {
		System.out.println(id);
		ProjectDto project = service.projectView(id);
		m.addAttribute("project",project);
		
		return "project/view";
	}
	@GetMapping("/project/edit/{id}")
	public String projectEditForm(@PathVariable(name = "id") int id, Model m) {
		
		ProjectDto project = service.projectView(id);
		m.addAttribute("project", project);
		
		return "project/edit";
	}
	
	@PutMapping("/project/edit")
	public String projectEdit(ProjectDto dto) {
		
		service.projectUpdate(dto);
		
		return "redirect:/projectlist";
	}
	
	@DeleteMapping("/project/delete/{id}")
	public String projectDelete(@PathVariable(name = "id") int id) {
		
		service.projectDelete(id);
		
		return "redirect:/projectlist";
	}
	
}
