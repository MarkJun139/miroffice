package com.group4.miroffice.forum;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface DeptDao {

	@Select("select dept_name from department where dept_no = #{deptno}")
	String deptName(int deptno);
}
