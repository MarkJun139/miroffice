package com.group4.miroffice.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.group4.miroffice.user.UserDao;
import com.group4.miroffice.user.Users;

@Service
public class InfoService {

	@Autowired
	private UserDao userDao;

	public Users Profile(String empname) {
		return userDao.profile(empname);
	}

	public int InfoUpdate(Users user) {
		return userDao.infoUpdate(user);
	}
}
