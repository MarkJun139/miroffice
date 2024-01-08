package com.group4.miroffice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.group4.miroffice.dto.Schedule;

@Mapper
public interface ScheduleDao {

	@Select("select * from schedule")
	List<Map<String, Object>> mainSchedule();
	
	@Insert("insert into schedule values ({sche_no}, {emp_no}, {dept_no}, {sche_start_date}, {sche_end_date}, {sche_title}, {sche_allday}, {sche_category})")
	List<Schedule> insertSchedule(Schedule schedule);
	
	@Update("update schedule set scheTitle = {sche_title} where scheNo = {sche_no}")
	List<Schedule> updateSchedule(Schedule schedule);
	
	@Delete("delete from schedule where scheNo = {sche_no}")
	int deleteSchedule(int scheduleNo);
}
