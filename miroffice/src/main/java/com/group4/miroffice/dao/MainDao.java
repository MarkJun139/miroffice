package com.group4.miroffice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.group4.miroffice.dto.Schedule;
import com.group4.miroffice.forum.ForumDto;

@Mapper
public interface MainDao {

	@Select("select sche_no, emp_no, sche_start_date, sche_end_date, sche_title, sche_allday, sche_category, color from schedule where emp_no = #{empNo} limit 10 ")
	List<Schedule> getScheduleList(int empNo);
	
	@Select("select forum_no, emp_no, dept_no, forum_title, forum_text, forum_date, forum_count, forum_notice, forum_files, emp_name from forum natural join employee")
	List<ForumDto> getForumList();
	
}