package com.group4.miroffice.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dao.UserDao;
import com.group4.miroffice.dto.Users;

@Service
public class InfoService {

	@Autowired
	private UserDao userDao;

	public Users Profile(String empname) {
		return userDao.profile(empname);
	}

	public int infoUpdate(Users user) {
			return 0;
	}
}
