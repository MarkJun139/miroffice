package com.group4.miroffice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.group4.miroffice.dto.Address;

@Mapper
public interface AddressDao {

	@Select("SELECT DISTINCT department.dept_name, employee.* FROM employee"
			+ " INNER JOIN department ON employee.dept_no = department.dept_no order by department.dept_name")
	List<Address> usersInfo();
	
	@Select("SELECT dept_name FROM department")
	List<String> deptName();
	
	@Select("SELECT DISTINCT department.dept_name, employee.* FROM employee"
			+ " INNER JOIN department ON employee.dept_no = department.dept_no"
			+ " WHERE dept_name = #{deptName} ORDER BY department.dept_name")
	List<Address> searchAddress(String deptName);
}
