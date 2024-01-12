package com.group4.miroffice.info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.group4.miroffice.dto.Dept;
import com.group4.miroffice.user.UserDao;
import com.group4.miroffice.user.Users;

@Service
public class InfoService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	public Users Profile(String empname) {
		return userDao.profile(empname);
	}

	public int InfoUpdate(Users user) {
		return userDao.infoUpdate(user);
	}

	public boolean PasswordCheck(Users user, Users password) {

		if (passwordEncoder.matches(password.getEmpPw(), user.getEmpPw())) {
			return true;
		}
		return false;

	}
	
	public Dept Dept(int deptNo){
		return userDao.dept(deptNo);
	}

}
