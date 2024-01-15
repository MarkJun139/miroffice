package com.group4.miroffice.project;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.ProjectDao;
import com.group4.miroffice.dto.Project;
import com.group4.miroffice.user.Users;

@Service
public class ProjectService {

	@Autowired
	ProjectDao dao;
	
	public List<Project> projectList(int empNo){
		int deptno = dao.getDeptNo(empNo);
		return dao.projectList(deptno);
	}
	public int projectWrite(Project dto) {
		return dao.projectWrite(dto);
	}
	public List<Project> projectMain(Project dto) {
		return dao.projectMain();
	}
	
	public Project projectView(int projectno) {
		return dao.projectView(projectno);
	}
	
	public int projectUpdateProgress(Project dto) {
		return dao.projectUpdateProgress(dto);
	}
	public int projectUpdate(Project dto) {
		return dao.projectUpdate(dto);
	}
	public List<Users> userInfo(int empno) {
		return dao.userInfo(empno);
	}
	public int projectDelete(int projectno) {
		return dao.projectDelete(projectno);
	}
	public String getDeptName(int empno) {
		return dao.getDeptName(empno);
	}
}
