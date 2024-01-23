package com.group4.miroffice.controller;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.MainDao;
import com.group4.miroffice.dto.Checkout;
import com.group4.miroffice.dto.Schedule;
import com.group4.miroffice.forum.ForumDto;

@Service
public class MainService {
	
	@Autowired
	MainDao dao;
	
	public List<Schedule> getScheduleList(int empNo){
		return dao.getScheduleList(empNo);
	}
	
	public List<ForumDto> getForumList(int deptNo) {
		return dao.getForumList();
	}
	public Integer getDeptNo(int empNo) {
		return dao.getDeptNo(empNo);
	}
	
	public LocalTime getStartDate(int empNo) {
		return dao.getStartTime(empNo);
	}
	
	public LocalTime getEndDate(int empNo) {
		return dao.getEndTime(empNo);
	}
	public int getWorkDate(int empNo) {
		return dao.getWorkTime(empNo);
	}
}
