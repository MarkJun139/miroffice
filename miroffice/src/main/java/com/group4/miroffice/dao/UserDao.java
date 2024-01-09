package com.group4.miroffice.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.group4.miroffice.dto.Users;

@Mapper
public interface UserDao {

	@Select("select * from employee where emp_no = #{empNo}")
	Users findById(int empNo);
	
	@Select("select * from employee where emp_name = #{empname}")
	Users profile(String empname);
	
	@Update("update employee set emp_phone = #{empPhone}, emp_address = #{empAddress},"
			+ " emp_address2 = #{empempAddress2}, emp_email = #{empEmail}, emp_photo = #{empPhoto},"
			+ " emp_pw = #{empPw} where emp_name = #{empname}")
	int infoUpdate(Users user);
	
//	@Insert("insert into users values (#{id}, #{password}, #{name}, #{role}, 'T')")
//	int insertUser(Users user);
}
