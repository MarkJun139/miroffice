package com.group4.miroffice.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.group4.miroffice.dto.Checkout;
import com.group4.miroffice.dto.DayCheck;
import com.group4.miroffice.dto.Dept;

@Mapper
public interface UserDao {

	@Select("select * from employee where emp_no = #{empNo}")
	Users findById(int empNo);
	
	@Select("select * from employee where emp_no = #{empname}")
	Users profile(String empname);
	
	@Select("select emp_no, emp_name, emp_rank, emp_job from employee where dept_no = #{deptNo}")
	List<Users> findMyDeptEmp(int deptNo);
	
	@Select("select emp_no, emp_name, emp_rank, emp_job from employee where emp_no = #{u1} or emp_no = #{u2} or emp_no = #{u3}")
	List<Users> findMyApproveEmp(Map<String, Integer> map);
	
	@Select("SELECT * FROM checkout WHERE emp_no = #{empNo} AND check_date = #{check_date}")
	Checkout checkout(DayCheck dayCheck);
	
	@Select("select * from department where dept_no = #{deptNo}")
	Dept dept(int deptNo);
	
	@Update("UPDATE employee SET emp_photo = #{empPhoto}, emp_name = #{empName}, emp_phone = #{empPhone},"
			+ " emp_address = #{empAddress}, emp_address2 = #{empAddress2},"
			+ " emp_email = #{empEmail}, emp_pw = #{empPw} WHERE emp_no = #{empNo}")
	int infoUpdate(Users user);
	
	@Insert("INSERT INTO checkout(emp_no, dept_no, check_date, check_start_time)"
			+ " VALUES (#{emp_no}, #{dept_no}, #{check_date}, #{check_start_time})")
	int start(Checkout checkout);
	
	@Insert("INSERT INTO checkout(emp_no, dept_no, check_date, check_start_time, check_late)"
			+ " VALUES (#{emp_no}, #{dept_no}, #{check_date}, #{check_start_time}, 1)")
	int lateStart(Checkout checkout);
	
	@Update("UPDATE checkout SET check_end_time = #{check_end_time}, check_work_time = timediff(#{check_end_time}, check_start_time)"
			+ " WHERE dept_no = #{dept_no} AND check_date = #{check_date}")
	int end(Checkout checkout);
//	@Insert("insert into users values (#{id}, #{password}, #{name}, #{role}, 'T')")
//	int insertUser(Users user);
}
