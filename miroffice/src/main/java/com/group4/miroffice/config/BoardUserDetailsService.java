package com.group4.miroffice.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.group4.miroffice.user.UserDao;
import com.group4.miroffice.user.Users;


@Service
public class BoardUserDetailsService implements UserDetailsService {

	@Autowired
	private UserDao userDao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("유저네임"+username);
		Users user = userDao.findById(Integer.parseInt(username));
		if (user == null) {
			throw new UsernameNotFoundException(username + " 사용자 없음");
		} else {
			return new SecurityUser(user);
		}
	}
}