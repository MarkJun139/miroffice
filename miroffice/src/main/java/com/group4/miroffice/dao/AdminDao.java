package com.group4.miroffice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.group4.miroffice.dto.Admin;
import com.group4.miroffice.dto.Dept;
import com.group4.miroffice.dto.Main;
import com.group4.miroffice.dto.Users;

@Mapper
public interface AdminDao {

	@Select("select * from department where not dept_no in(99)")
	List<Dept> deptList();
	
	@Select("SELECT LPAD(count(*), 3, '0') AS count FROM employee where dept_no in(#{deptNo})")
	String getEmpCount(int deptNo);
	
	@Select("select emp_no, emp_name, dept_name, emp_job, emp_rank, emp_sal,  emp_role  from employee natural join department where dept_name not in ('관리자')")
	List<Main> empList();
	
	@Insert("insert into employee (emp_no, dept_no, emp_pw, emp_name, emp_hiredate, emp_job, emp_rank, emp_phone, emp_sal, emp_address, emp_address2, emp_email, emp_photo, emp_birth, emp_role, emp_dayoff) values (#{empNo}, #{deptNo}, #{empPw}, #{empName}, #{empHiredate}, #{empJob}, #{empRank}, #{empPhone}, #{empSal}, #{empAddress}, #{empAddress2}, #{empEmail}, #{empPhoto}, #{empBirth}, #{empRole}, #{empDayoff})")
	int addEmp(Admin admin);
	
}
