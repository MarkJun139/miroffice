package com.group4.miroffice.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.group4.miroffice.dto.Schedule;

@Mapper
public interface ScheduleDao {

	@Select("select * from schedule")
	Schedule mainSchedule(Schedule schedule);

}
