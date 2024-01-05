package com.group4.miroffice.approval;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ApprovalDao {
	
	@Select("select * from approval where dept_no = #{id}")
	ApprovalDto approval(int id);

	int approvalSubmit(HashMap<String, Object> map);
}
