package com.group4.miroffice.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.group4.miroffice.dto.Users;



@Mapper
public interface UserDao {
	
	@Select("select * from employee where emp_no = {empno} and emp_pw = {emppw}")
	Users login(Users user);
	
	@Select("select * from employee where emp_no = #{empno}")
	Users findById(String id);
	
}
