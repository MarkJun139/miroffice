package com.group4.miroffice.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.login.UserDao;
import com.group4.miroffice.login.Users;

@Service
public class LoginService {
	
	@Autowired
	UserDao dao;
	
	public Users login(Users users) {
		return dao.login(users);
	}

}
