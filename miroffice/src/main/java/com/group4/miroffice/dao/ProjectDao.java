package com.group4.miroffice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.group4.miroffice.dto.ProjectDto;
import com.group4.miroffice.dto.Users;

@Mapper
public interface ProjectDao {
		
	@Select("select * from project")
	List<ProjectDto> projectList();
	
	@Select("select emp_no, dept_no, emp_name, emp_role from employee where emp_no = #{empno}")
	List<Users> userInfo(int empno);
	
	@Select("select * from project where project_no = #{projectno}")
	ProjectDto projectView(int projectno);
	
	@Insert("insert into project (emp_no, dept_no, project_title, project_text, project_start, project_end) VALUES (#{empno},#{deptno} , #{projecttitle}, #{projecttext}, #{projectstart}, #{projectend})")
	int projectWrite(ProjectDto project);
	
	@Update("update project set project_percent = #{projectpercent} where project_no = #{projectno}")
	int projectUpdateProgress(ProjectDto project);
	
	@Update("update project set project_title = #{projecttitle}, project_text = #{projecttext}, project_start = ${projectstart}, project_end = #{projectend} where project_no = #{projectno}")
	int projectUpdate(ProjectDto project);
	
	@Delete("delete from project where project_no = #{project_no}")
	int projectDelete(int projectno);
	
}
