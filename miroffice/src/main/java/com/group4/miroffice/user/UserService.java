package com.group4.miroffice.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	UserDao ud;
	
	public Users findById(int empNo){
		return ud.findById(empNo);
	}
	
	public Users profile(String enpname) {
		return ud.profile(enpname);
	}
	
	public int infoUpdate(Users user) {
		return ud.infoUpdate(user);
	}
	
	public List<Users> findMyDeptEmp(int deptNo){
		return ud.findMyDeptEmp(deptNo);
	}
	
	public Users findMyApproveEmp(int empNo){
		return ud.findMyApproveEmp(empNo);
	}
	
		
}
