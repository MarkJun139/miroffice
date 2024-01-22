package com.group4.miroffice.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.group4.miroffice.dto.CheckDate;
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
	
	@Select("select * from department where dept_no = #{deptNo}")
	Dept dept(int deptNo);
	
	@Update("UPDATE employee SET emp_photo = #{empPhoto}, emp_name = #{empName}, emp_phone = #{empPhone},"
			+ " emp_address = #{empAddress}, emp_address2 = #{empAddress2},"
			+ " emp_email = #{empEmail}, emp_pw = #{empPw} WHERE emp_no = #{empNo}")
	int infoUpdate(Users user);
	
	@Insert("INSERT INTO checkout(emp_no, dept_no, check_date, check_start_time, check_on)"
			+ " VALUES (#{empNo}, #{deptNo}, #{checkDate}, #{checkStartTime}, 1)")
	int start(Checkout checkout);
	
	@Insert("INSERT INTO checkout(emp_no, dept_no, check_date, check_start_time, check_on, check_late)"
			+ " VALUES (#{empNo}, #{deptNo}, #{checkDate}, #{checkStartTime}, 1, 1)")
	int lateStart(Checkout checkout);
	
	@Update("UPDATE checkout SET check_end_time = #{checkEndTime}, check_work_time = timestampdiff(second ,check_start_time, check_end_time),"
			+ " check_leave_early = 0 WHERE dept_no = #{deptNo} AND check_date = #{checkDate}")
	int end(Checkout checkout);
	
	@Update("UPDATE checkout SET check_end_time = #{checkEndTime}, check_work_time = timestampdiff(second ,check_start_time, check_end_time),"
			+ " check_leave_early = 1 WHERE dept_no = #{deptNo} AND check_date = #{checkDate}")
	int earlyEnd(Checkout checkout);
	
	@Select("select sum(check_on) as checkOn, sum(check_leave_early) as CheckLeaveEarly,"
			+ " sum(check_halfoff) as checkHalfoff, sum(check_dayoff) as checkDayoff,"
			+ " sum(check_vacation) as checkVacation, sum(check_late) as CheckLate,"
			+ " sum(check_absenteeism) as checkAbsenteenism, sum(check_work_time) as checkWorkTime from checkout"
			+ " where check_date between #{checkMonthStart} and #{checkDate} and emp_no = #{empNo}")
	CheckDate checkdate(DayCheck daycheck);
	
	@Select("select week(check_date) AS weekNumber, sum(check_on) as checkOn, sum(check_leave_early) as CheckLeaveEarly,"
			+ " sum(check_halfoff) as checkHalfoff, sum(check_dayoff) as checkDayoff,"
			+ " sum(check_vacation) as checkVacation, sum(check_late) as CheckLate,"
			+ " sum(check_absenteeism) as checkAbsenteenism, sum(check_work_time) as checkWorkTime from checkout"
			+ " where check_date between #{checkMonthStart} and #{checkDate} and emp_no = #{empNo}"
			+ " and week(check_date) = #{week} group by weekNumber order by weekNumber")
	CheckDate weekCheck(DayCheck daycheck);
	
	@Select("select emp_name from employee where dept_no = #{deptNo}")
	List<String> searchEmp(int deptNo);
	
	@Select("select * from employee where emp_name = #{empName}")
	Users leaderCheck(String empName);
	
	@Select("select * from checkout where check_date = #{checkDate} and emp_no = #{empNo}")
	Checkout checkout(DayCheck dayCheck);
	
	@Update("UPDATE checkout SET check_start_time = #{checkStartTime} check_on = 1 WHERE emp_no = #{empNo} AND check_date = #{checkDate}")
	int startUpdate(Checkout checkout);
	
	@Insert("INSERT INTO checkout(emp_no, dept_no, check_date, check_halfoff) VALUES (#{empNo}, #{deptNo}, #{checkDate}, 1)")
	int halfoff(DayCheck dayCheck);
	
	@Update("UPDATE checkout SET check_halfoff = 1 WHERE emp_no = #{empNo} AND check_date = #{checkDate}")
	int halfoffUpdate(DayCheck dayCheck);
	
	@Insert("INSERT INTO checkout(emp_no, dept_no, check_date, check_dayoff) VALUES (#{empNo}, #{deptNo}, #{checkDate}, 1)")
	int dayoff(DayCheck dayCheck);
	
	@Insert("INSERT INTO checkout(emp_no, dept_no, check_date, check_absenteeism) VALUES (#{empNo}, #{deptNo}, #{checkDate}, 1)")
	int absenteeism(DayCheck dayCheck);
	
	@Insert("INSERT INTO checkout(emp_no, dept_no, check_date, check_vacation) VALUES (#{empNo}, #{deptNo}, #{checkDate}, 1)")
	int vacation(DayCheck dayCheck);
	
//	@Insert("insert into users values (#{id}, #{password}, #{name}, #{role}, 'T')")
//	int insertUser(Users user);
}
