package com.group4.miroffice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.MainDao;
import com.group4.miroffice.dto.Schedule;
import com.group4.miroffice.forum.ForumDto;

@Service
public class MainService {
	
	@Autowired
	MainDao dao;
	
	public List<Schedule> getScheduleList(int empNo){
		return dao.getScheduleList(empNo);
	}
	
	public List<ForumDto> getForumList() {
		return dao.getForumList();
	}
}
