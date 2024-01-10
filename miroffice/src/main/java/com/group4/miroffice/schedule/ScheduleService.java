package com.group4.miroffice.schedule;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.ScheduleDao;
import com.group4.miroffice.dto.Schedule;

@Service
public class ScheduleService {

	@Autowired
	ScheduleDao dao;

	public List<Map<String, Object>> mainSchedule() {
		return dao.mainSchedule();
	}

	public void insertSchedule(Map<String, Object> newSchedule) {
	}

	public List<Schedule> updateSchedule(Schedule schedule) {
		return dao.updateSchedule(schedule);
	}

	public int deleteSchedule(int scheduleNo) {
		return dao.deleteSchedule(scheduleNo);
	}
}
