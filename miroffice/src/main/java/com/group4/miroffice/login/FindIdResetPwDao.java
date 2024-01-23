package com.group4.miroffice.login;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.group4.miroffice.user.Users;

@Mapper
public interface FindIdResetPwDao {

	@Select("select * from employee where emp_name = #{empName} and emp_phone = #{empPhone}")
	Users findId(Users user);

	@Select("select emp_pw from employee where emp_name = #{empName} and emp_no = #{empNo} and "
			+ "emp_email = #{empEmail}")
	String findPassword(@Param("empName") String name, @Param("empNo") String no, @Param("empEmail") String email);

	@Update("update employee set emp_pw = #{empPw} where emp_name = #{empName} and emp_no = #{empNo}")
	int resetPassword(@Param("empPw") String password, @Param("empName") String name, @Param("empNo") String no);
}
