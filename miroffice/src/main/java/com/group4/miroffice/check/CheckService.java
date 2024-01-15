package com.group4.miroffice.check;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dto.Checkout;
import com.group4.miroffice.user.UserDao;

@Service
public class CheckService {

	@Autowired
	private UserDao userDao;
	
	public Checkout Check(int empNO) {
		return userDao.checkout(empNO);
	}
	
}
