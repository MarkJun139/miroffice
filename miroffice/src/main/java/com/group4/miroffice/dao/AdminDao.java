package com.group4.miroffice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.group4.miroffice.dto.Admin;
import com.group4.miroffice.dto.Dept;
import com.group4.miroffice.dto.Main;
import com.group4.miroffice.dto.Project;
import com.group4.miroffice.user.Users;

@Mapper
public interface AdminDao {

	@Select("select * from department where not dept_no in(99)")
	List<Dept> deptList();
	
	@Select("SELECT LPAD(count(*), 3, '0') AS count FROM employee where dept_no in(#{deptNo})")
	String getEmpCount(int deptNo);
	
	@Select("select emp_no, emp_name, dept_name, emp_job, emp_rank, emp_sal, emp_role, emp_photo from employee natural join department where dept_name not in ('관리자')")
	List<Main> empList();
	
	@Insert("insert into employee (emp_no, dept_no, emp_pw, emp_name, emp_hiredate, emp_job, emp_rank, emp_phone, emp_sal, emp_address, emp_address2, emp_email, emp_photo, emp_birth, emp_role, emp_dayoff) values (#{empNo}, #{deptNo}, #{empPw}, #{empName}, #{empHiredate}, #{empJob}, #{empRank}, #{empPhone}, #{empSal}, #{empAddress}, #{empAddress2}, #{empEmail}, #{empPhoto}, #{empBirth}, #{empRole}, #{empDayoff})")
	int addEmp(Admin admin);
	
	@Select("select emp_photo from employee where emp_no = #{empNo}")
	String getEmpPhoto(int empNo);
	
	@Delete("delete from employee where emp_no = #{empNo}")
	int deleteEmp(int empNo);
	
	@Select("select * from employee where emp_no = #{empNo}")
	Admin empInfo(int empNo);
	
	@Update("UPDATE employee SET dept_no = #{deptNo}, emp_pw = #{empPw}, emp_name = #{empName}, emp_hiredate = #{empHiredate}, "
			+ "emp_job = #{empJob}, emp_rank = #{empRank}, emp_phone = #{empPhone}, emp_sal = #{empSal}, emp_address = #{empAddress}, "
			+ "emp_address2 = #{empAddress2}, emp_email = #{empEmail}, emp_photo = #{empPhoto}, emp_birth = #{empBirth}, emp_role = #{empRole}, "
			+ "emp_dayoff = #{empDayoff} WHERE emp_no = #{empNo}")
	int empUpdate(Admin admin);
	
	
	
	
}
