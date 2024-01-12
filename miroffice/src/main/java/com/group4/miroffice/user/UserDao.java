package com.group4.miroffice.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface UserDao {

	@Select("select * from employee where emp_no = #{empNo}")
	Users findById(int empNo);
	
	@Select("select * from employee where emp_name = #{empName}")
	Users profile(String empname);
	
	@Select("select emp_no, emp_name, emp_rank, emp_job from employee where dept_no = #{deptNo}")
	List<Users> findMyDeptEmp(int deptNo);
	
	@Select("select emp_no, emp_name, emp_rank, emp_job from employee where emp_no = #{u1} or emp_no = #{u2} or emp_no = #{u3}")
	List<Users> findMyApproveEmp(Map<String, Integer> map);
	
	@Update("update employee set emp_phone = #{empPhone}, emp_address = #{empAddress},"
			+ " emp_address2 = #{empempAddress2}, emp_email = #{empEmail}, emp_photo = #{empPhoto},"
			+ " emp_pw = #{empPw} where emp_name = #{empname}")
	int infoUpdate(Users user);
	
//	@Insert("insert into users values (#{id}, #{password}, #{name}, #{role}, 'T')")
//	int insertUser(Users user);
}
