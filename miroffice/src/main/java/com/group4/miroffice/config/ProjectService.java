package com.group4.miroffice.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.ProjectDao;
import com.group4.miroffice.dto.ProjectDto;
import com.group4.miroffice.dto.Users;

@Service
public class ProjectService {

	@Autowired
	ProjectDao dao;
	
	public List<ProjectDto> projectList(){
		return dao.projectList();
	}
	public int projectWrite(ProjectDto dto) {
		return dao.projectWrite(dto);
	}
	
	public ProjectDto projectView(int projectno) {
		return dao.projectView(projectno);
	}
	
	public int projectUpdateProgress(ProjectDto dto) {
		return dao.projectUpdateProgress(dto);
	}
	public int projectUpdate(ProjectDto dto) {
		return dao.projectUpdate(dto);
	}
	public List<Users> userInfo(int empno) {
		return dao.userInfo(empno);
	}
	public int projectDelete(int projectno) {
		return dao.projectDelete(projectno);
	}
	 
}
