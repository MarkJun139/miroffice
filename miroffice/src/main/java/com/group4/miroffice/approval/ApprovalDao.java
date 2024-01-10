package com.group4.miroffice.approval;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface ApprovalDao {

//	@Select("select * from approval where dept_no = #{deptno}")
	List<ApprovalDto> approvalList(int deptno);

	int approvalSubmit(HashMap<String, Object> map);
	
	
	int adminApprovalWrite(ApprovalDto dto);
	
	
}
