package com.group4.miroffice.forum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DeptService {

	@Autowired
	DeptDao dao;
	
	public String deptName(int deptno) {
		return dao.deptName(deptno);
	}
}
