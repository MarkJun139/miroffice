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

	@Select("select sche_title as title, DATE_FORMAT(sche_start_date, '%Y-%m-%d') as start from schedule")
	List<Map<String, Object>> mainSchedule();
	
	@Insert("insert into schedule values (#{scheNo}, #{empNo}, #{deptNo}, #{scheStartDate}, #{scheEndDate}, "
			+ "#{scheTitle}, #{scheAllday}, #{scheCategory})")
	List<Schedule> insertSchedule(Schedule schedule);
	
	@Update("update schedule set sche_title = #{scheTitle}, sche_start_date = #{scheStartDate}, "
			+ "sche_end_date = #{scheEndDate}, sche_allday = #{scheAllday}, sche_category = #{scheCategory} "
			+ "where sche_no = #{scheNo}")
	List<Schedule> updateSchedule(Schedule schedule);
	
	@Delete("delete from schedule where scheNo = {sche_no}")
	int deleteSchedule(int scheduleNo);
}
