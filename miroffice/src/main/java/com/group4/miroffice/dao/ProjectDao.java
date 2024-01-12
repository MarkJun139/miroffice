package com.group4.miroffice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.group4.miroffice.dto.Project;
import com.group4.miroffice.user.Users;

@Mapper
public interface ProjectDao {
		
	@Select("select project_no, emp_name, project_title, dept_no, project_text, project_start, project_end, project_percent, DATEDIFF(project_end, CURRENT_DATE) AS projectdiffdate from project natural join employee where dept_no = #{deptno}")
	List<Project> projectList(int deptNo);
	
	@Select("select dept_no from employee natural join department where emp_no = #{empno}")
	int getDeptNo(int empNo);
	
	@Select("select dept_name from employee natural join department where emp_no = ${empno}")
	String getDeptName(int empNo);
	
	@Select("select emp_no, dept_no, emp_name, emp_role from employee where emp_no = #{empno}")
	List<Users> userInfo(int empno);
	
	@Select("select project_title, project_text, project_start, project_end, project_percent from project order by project_end limit 5;")
	List<Project> projectMain();
	
	@Select("select project_no, emp_no, emp_name, project_title, project_text, project_start, project_end, project_percent, DATEDIFF(project_end, project_start) AS day_difference from project natural join employee where project_no = #{projectno}")
	Project projectView(int projectno);
	
	@Insert("insert into project (emp_no, dept_no, project_title, project_text, project_start, project_end) VALUES (#{empno},#{deptno} , #{projecttitle}, #{projecttext}, #{projectstart}, #{projectend})")
	int projectWrite(Project project);
	
	@Update("update project set project_percent = #{projectpercent} where project_no = #{projectno}")
	int projectUpdateProgress(Project project);
	
	@Update("update project set project_title = #{projecttitle}, project_text = #{projecttext}, project_start = #{projectstart}, project_end = #{projectend} where project_no = #{projectno}")
	int projectUpdate(Project project);
	
	@Delete("delete from project where project_no = #{project_no}")
	int projectDelete(int projectno);
	
}
