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

	@Select("select sche_title as title, DATE_FORMAT(sche_start_date, '%Y-%m-%d') as start, "
			+ "DATE_FORMAT(sche_end_date, '%Y-%m-%d') as end, sche_allday as allDay from schedule")
	List<Map<String, Object>> mainSchedule();

	@Insert("insert into schedule (sche_title, sche_start_date, sche_end_date) "
			+ "values (#{title}, #{start}, #{end})")
	int insertSchedule(Map<String, Object> newSchedule);

	@Update("update schedule set sche_start_date = #{start}, sche_end_date = #{end} where sche_title = #{title}")
	int updateSchedule(Map<String, Object> updateSchedule);

	@Delete("delete from schedule where sche_title = #{title} and sche_start_date = #{start}")
	int deleteSchedule(Map<String, Object> delSchedule);
}