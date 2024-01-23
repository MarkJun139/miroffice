package com.group4.miroffice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface ScheduleDao {
	
	// 개인 일정
	@Select("select sche_no, sche_title as title, DATE_FORMAT(sche_start_date, '%Y-%m-%d %T') as start, "
			+ "DATE_FORMAT(sche_end_date, '%Y-%m-%d %T') as end, sche_allday as allDay, color,"
			+ " emp_no, dept_no from schedule where emp_no = #{empNo}")
	List<Map<String, Object>> mainSchedule(int empNo);

	@Insert("insert into schedule (sche_title, sche_start_date, sche_end_date, sche_allDay,"
			+ " color, emp_no, dept_no) "
			+ "values (#{title}, #{start}, #{end}, #{allDay}, #{color}, #{empNo},"
			+ " #{deptNo})")
	int insertSchedule(Map<String, Object> newSchedule);

	@Update("update schedule set sche_start_date = #{start}, sche_end_date = #{end}, sche_title = #{title},"
			+ " color = #{color}, sche_allday = #{allDay} where sche_no = #{scheNo} and dept_no = #{deptNo} and emp_no = #{empNo}")
	int updateSchedule(Map<String, Object> updateSchedule);
	
	
	@Delete("delete from schedule where emp_no = #{empNo} and dept_no = #{deptNo} and sche_no = #{scheNo}")
	int deleteSchedule(Map<String, Object> delSchedule);
	
	
	// 부서별 일정
	@Select("select emp_name, sche_no, sche_title as title, DATE_FORMAT(sche_start_date, '%Y-%m-%d %T') as start, "
			+ "DATE_FORMAT(sche_end_date, '%Y-%m-%d %T') as end, sche_allday as allDay, color,"
			+ " emp_no, dept_no from schedule natural join employee where dept_no = #{deptNo}")
	List<Map<String, Object>> deptSchedule(int deptNo);
	
	@Select("select emp_name from employee natural join schedule where sche_no = #{scheNo}")
	String findEmpName(String scheNo);
}