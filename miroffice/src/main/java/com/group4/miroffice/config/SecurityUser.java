package com.group4.miroffice.config;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;

import com.group4.miroffice.dto.Users;

public class SecurityUser extends User {
	private static final long serialVersionUID = 1L;
	
	private Users users;
	
	public SecurityUser(Users user) {
		super(user.getEmpno(), user.getEmppw(), AuthorityUtils.createAuthorityList(user.getEmprole().toString()));
		this.users = user;
	}
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public Users getUsers() {
		return users;
	}
}