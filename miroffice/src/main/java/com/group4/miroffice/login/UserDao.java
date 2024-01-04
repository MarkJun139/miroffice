package com.group4.miroffice.login;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserDao {
	
	@Select("select * from employee where emp_no = {empno}")
	Users login(Users user);
	
	/*
	 * @Select("select * from employee where emp_no = #{empno}") Users
	 * findById(String id);
	 */
	
}
