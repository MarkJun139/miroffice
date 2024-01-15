package com.group4.miroffice.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.group4.miroffice.dao.AdminDao;
import com.group4.miroffice.dto.Admin;
import com.group4.miroffice.dto.Dept;
import com.group4.miroffice.dto.Main;


@Service
public class AdminService {

	@Autowired
	AdminDao dao;
	
	public void addEmp(Admin admin) {
		dao.addEmp(admin);
		dao.addCheckOut(admin);
	}
	public List<Dept> deptList() {
		return dao.deptList();
	}
	public String getEmpCount(int deptNo) {
		return dao.getEmpCount(deptNo);
	}
	public List<Main> empList() {
		return dao.empList();
	}
	public int deleteEmp(int empNo) {
		return dao.deleteEmp(empNo);
	}
	public String getEmpPhoto(int empNo) {
		return dao.getEmpPhoto(empNo);
	}
	public Admin empInfo(int empNo) {
		return dao.empInfo(empNo);
	}
	public int empUpdate(Admin admin) {
		return dao.empUpdate(admin);
	}
	public int deleteDept(int deptNo) {
		return dao.deleteDept(deptNo);
	}
	public int addDept(Dept dept) {
		return dao.addDept(dept);
	}
	public int isEmpNo(int empNo) {
		return dao.isEmpNo(empNo);
	}
	public int updateDept(Dept dept) {
		return dao.updateDept(dept);
	}
	public void deleteCheck(List<Integer> checkList) {
		for(int deptNo : checkList) {
			dao.deleteDept(deptNo);
		}
	}
	public int isDeptNo(int deptNo) {
		return dao.isDeptNo(deptNo);
	}
	public void deleteEmpCheck(List<String> checkList){
		for(String empNo : checkList) {
			dao.deleteEmp(Integer.parseInt(empNo));
		}
	}
	
}
