package com.group4.miroffice.check;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dto.CheckDate;
import com.group4.miroffice.dto.Checkout;
import com.group4.miroffice.dto.DayCheck;
import com.group4.miroffice.user.UserDao;
import com.group4.miroffice.user.Users;

@Service
public class CheckService {

	@Autowired
	private UserDao userDao;
	
	public int start(Checkout chekout) {
		return userDao.start(chekout);
	}
	
	public int lateStart(Checkout checkout) {
		return userDao.lateStart(checkout);
	}
	
	public int end(Checkout checkout) {
		return userDao.end(checkout);
	}
	
	public int earlyEnd(Checkout checkout) {
		return userDao.earlyEnd(checkout);
	}
	
	public CheckDate checkdate(DayCheck daycheck) {
		return userDao.checkdate(daycheck);
	}
	
	public CheckDate weekCheck(DayCheck daycheck) {
		return userDao.weekCheck(daycheck);
	}
	
	public List<String> searchEmp(int deptNo){
		return userDao.searchEmp(deptNo);
	}
	
	public Users leaderCheck(String empName) {
		return userDao.leaderCheck(empName);
	}
	
	public Checkout checkout(DayCheck daycheck) {
		return userDao.checkout(daycheck);
	}
	
	
}
