package com.group4.miroffice.project;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.util.HtmlUtils;

import com.group4.miroffice.dto.Project;
import com.group4.miroffice.user.Users;

@Controller
@RequestMapping("/main")
public class ProjectController {
	
	@Autowired
	ProjectService service;

	@GetMapping("/projectlist")
	public String projectList(Model m, Authentication authentication) {
		// 본인 부서만 보여주기
		System.out.println(authentication.getName());
		int empno = Integer.parseInt(authentication.getName());
		System.out.println("프로젝트 목록");
		String deptName = service.getDeptName(empno);
		List<Project> projectList = service.projectList(empno);
		
		projectList.forEach(project -> {
		    project.setProjecttitle(HtmlUtils.htmlEscape(project.getProjecttitle()));
		    project.setProjecttext(HtmlUtils.htmlEscape(project.getProjecttext()));
		});
		
	
		m.addAttribute("deptName", deptName);
		m.addAttribute("projectList", projectList);
		
		return "project/list";
	}
	

	
	@GetMapping("/teamleader/projectwrite")
	public String projectWriteForm(Authentication authentication) {
		System.out.println(authentication.getName());
		return "project/write";
	}
	@PostMapping("/teamleader/project/write")
	public String projectWrite(Project dto, Authentication authentication) {
		try {
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/main/projectlist";
	}
	
	@GetMapping("/project/view/{id}")
	public String projectView(@PathVariable(name = "id") int id, Model m) {
		System.out.println(id + "번 프로젝트");
		Project project = service.projectView(id);
		project.setProjecttitle(HtmlUtils.htmlEscape(project.getProjecttitle()));
		project.setProjecttext(HtmlUtils.htmlEscape(project.getProjecttext()));
		m.addAttribute("project",project);
		
		return "project/view";
	}
	@GetMapping("/teamleader/project/edit/{id}")
	public String projectEditForm(@PathVariable(name = "id") int id, Model m) {
		
		Project project = service.projectView(id);
		project.setProjecttitle(HtmlUtils.htmlEscape(project.getProjecttitle()));
		project.setProjecttext(HtmlUtils.htmlEscape(project.getProjecttext()));
		m.addAttribute("project", project);
		
		return "project/edit";
	}
	
	@PutMapping("/teamleader/project/edit")
	public String projectEdit(Project dto) {
		try {
			service.projectUpdate(dto);
			System.out.println("프로젝트 수정");
			System.out.println("수정된 값 : " + dto.toString());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/main/projectlist";
	}
	
	@PutMapping("/teamleader/project/editprogress")
	public String projectEditProgress(Project dto) {
		try {
			service.projectUpdateProgress(dto);
			System.out.println("진행률 수정");
			System.out.println(dto.toString());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/main/projectlist";
	}
	
	@DeleteMapping("/teamleader/project/delete/{id}")
	public String projectDelete(@PathVariable(name = "id") int id) {
		try {
			System.out.println(id + " 번 프로젝트 삭제");
			service.projectDelete(id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/main/projectlist";
	}
	
}
