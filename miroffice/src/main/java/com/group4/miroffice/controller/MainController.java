package com.group4.miroffice.controller;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.util.HtmlUtils;

import com.group4.miroffice.dto.Checkout;
import com.group4.miroffice.dto.Project;
import com.group4.miroffice.dto.Schedule;
import com.group4.miroffice.forum.ForumDto;
import com.group4.miroffice.project.ProjectService;
import com.group4.miroffice.schedule.ScheduleService;
import com.group4.miroffice.user.Users;

@Controller
public class MainController {

	@Autowired
	ProjectService projectService;
	@Autowired
	ScheduleService scheduleService;
	@Autowired
	MainService mainService;
	// 메인 화면 정보
	
	@GetMapping("/main")
	public String main(Model m, Authentication authentication) {
		int empno = Integer.parseInt(authentication.getName());
		int deptNo = mainService.getDeptNo(empno);
		
		// 프로젝트 목록 
		List<Project> projectList = projectService.projectList(empno);
		projectList.forEach(project -> {
		    project.setProjecttitle(HtmlUtils.htmlEscape(project.getProjecttitle()));
		    project.setProjecttext(HtmlUtils.htmlEscape(project.getProjecttext()));
		});
		// 일정 목록
		List<Schedule> scheduleList = mainService.getScheduleList(empno);
		scheduleList.forEach(Schedule -> {
			Schedule.setScheTitle(HtmlUtils.htmlEscape(Schedule.getScheTitle()));
		});
		// 게시판 목록
		List<ForumDto> forumList = mainService.getForumList(deptNo);
		//
		
		
		try {
		    // 출근 시간 출력
			LocalTime getStartTime = mainService.getStartDate(empno);
			LocalTime getEndTime = mainService.getEndDate(empno);
			
			if(getStartTime != null && getEndTime != null) {
				int y = mainService.getWorkDate(empno);
				if (y > 60) {
					int H = (y / 60) / 60;
					int M = (y - (H * 60 * 60)) / 60;
					LocalTime checkTime = LocalTime.of(H, M, 00);
					m.addAttribute("checkTime", checkTime);
				} else {
					LocalTime checkTime2 = LocalTime.of(0, 0, 0);
					m.addAttribute("checkTime", checkTime2);
				}
			}
			
		    m.addAttribute("startTime", getStartTime);
		    m.addAttribute("endTime", getEndTime);
		    
		    
		    
		} catch (Exception e) {
		    System.out.println("에러 발생: " + e.getMessage());
		    e.printStackTrace(); // 스택 트레이스 출력
		    System.out.println("출석체크 에러");
		}
		
		
		m.addAttribute("projectList", projectList);
		m.addAttribute("scheduleList",scheduleList);
		m.addAttribute("forumList", forumList);
		
		
		// System.out.println(startTime);
		
		System.out.println("main 요청입니다.");
		return "main";
	}

}
