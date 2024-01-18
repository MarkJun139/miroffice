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

	public List<Map<String, Object>> mainSchedule(int empNo) {
		return dao.mainSchedule(empNo);
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
	
	public List<Map<String, Object>> deptSchedule(int deptNo) {
		return dao.deptSchedule(deptNo);
	}
	
	public String findEmpName(String sche_no) {
		return dao.findEmpName(sche_no);
	}
}