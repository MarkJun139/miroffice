package com.group4.miroffice.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FindIdResetPwService {
	
	@Autowired
	FindIdResetPwDao dao;
	
	public String findId(String name, String phone) {		
		return dao.findId(name, phone);
	}
}
