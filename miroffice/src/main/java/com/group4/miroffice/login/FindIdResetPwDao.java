package com.group4.miroffice.login;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface FindIdResetPwDao {
	
	@Select("select emp_no from employee where emp_name = #{empName} and emp_phone = #{empPhone}")
	String findId(@Param("empName") String name,@Param("empPhone") String phone);
	
	
}
