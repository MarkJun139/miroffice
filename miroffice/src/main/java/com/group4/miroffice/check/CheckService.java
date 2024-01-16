package com.group4.miroffice.check;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dto.Checkout;
import com.group4.miroffice.dto.DayCheck;
import com.group4.miroffice.user.UserDao;

@Service
public class CheckService {

	@Autowired
	private UserDao userDao;
	
	public Checkout Check(DayCheck dayCheck) {
		return userDao.checkout(dayCheck);
	}
	
	public int Start(Checkout chekout) {
		return userDao.start(chekout);
	}
	
	public int LateStart(Checkout checkout) {
		return userDao.lateStart(checkout);
	}
	
	public int End(Checkout checkout) {
		return userDao.end(checkout);
	}
	
	
}
