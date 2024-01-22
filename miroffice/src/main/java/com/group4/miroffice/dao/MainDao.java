package com.group4.miroffice.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.group4.miroffice.dto.Schedule;
import com.group4.miroffice.forum.ForumDto;

@Mapper
public interface MainDao {

	@Select("select sche_no, emp_no, sche_start_date, sche_end_date, sche_title, sche_allday from schedule where emp_no = #{empNo} limit 10 ")
	List<Schedule> getScheduleList(int empNo);
	
	@Select("select forum_no, emp_no, dept_no, forum_title, forum_text, forum_date, forum_count, forum_notice, forum_files, emp_name from forum natural join employee order by forum_date desc limit 10")
	List<ForumDto> getForumList();

	@Select("select dept_no from employee where emp_no = #{empNo}")
	int getDeptNo(int empNo);
	

	@Select("select check_start_time from checkout where check_date = CURDATE() and emp_no = #{emp_no}")
	Date getStartTime(int empNo);
	
	@Select("select check_end_time from checkout where check_date = CURDATE() and emp_no = #{emp_no}")
	Date getEndTime(int empNo);
	
}
