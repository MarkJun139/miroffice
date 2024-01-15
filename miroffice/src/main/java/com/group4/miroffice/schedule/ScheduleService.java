package com.group4.miroffice.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.ScheduleDao;

@Service
public class ScheduleService {

	@Autowired
	ScheduleDao dao;

	public List<Map<String, Object>> mainSchedule() {
		return dao.mainSchedule();
	}

	public int insertSchedule(Map<String, Object> newSchedule) {	
		return dao.insertSchedule(newSchedule);
	}

	public int updateSchedule(Map<String, Object> updateSchedule) {
		return dao.updateSchedule(updateSchedule);
	}

	public int deleteSchedule(Map<String, Object> delSchedule) {
		return dao.deleteSchedule(delSchedule);
	}
}