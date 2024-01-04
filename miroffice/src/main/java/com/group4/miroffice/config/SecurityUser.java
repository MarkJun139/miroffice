package com.group4.miroffice.config;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.group4.miroffice.login.Users;

public class SecurityUser extends User {
	private static final long serialVersionUID = 1L;

	private Users users;
	
	public SecurityUser(Users users) {
		
		super("" + users.getEmpNo(), "{noop}" + users.getEmpPw(), 
		AuthorityUtils.createAuthorityList(users.getEmpRole().toString()));
		System.out.println(users);
		this.users = users;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Users getUsers() {
		return users;
	}
	
	
}