package com.group4.miroffice.login;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface FindIdResetPwDao {

	@Select("select emp_no from employee where emp_name = #{empName} and emp_phone = #{empPhone}")
	String findId(@Param("empName") String name, @Param("empPhone") String phone);

	@Select("select emp_pw from employee where emp_name = #{empName} and emp_no = #{empNo} and "
			+ "emp_email = #{empEmail}")
	String findPassword(@Param("empName") String name, @Param("empNo") String no, @Param("empEmail") String email);

	@Update("update employee set emp_pw = #{empPw} where emp_name = #{empName} and emp_no = #{empNo}")
	int resetPassword(@Param("empPw") String password, @Param("empName") String name, @Param("empNo") String no);
}
