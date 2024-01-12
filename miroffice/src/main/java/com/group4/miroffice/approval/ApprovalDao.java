package com.group4.miroffice.approval;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.GetMapping;

import com.group4.miroffice.config.SecurityUser;
import com.group4.miroffice.user.Users;

@Mapper
public interface ApprovalDao {

//	@Select("select * from approval where dept_no = #{deptno}")
	List<ApprovalDto> approvalList(int deptno);
	
	List<ApprovalDto> approval(int empno);
	
	ApprovalDto approvalListOne(int appno);
	
	int approvalSubmit(ApprovalDto dto);
	
	int adminApprovalWrite(ApprovalDto dto);
	
	int adminApprovalEdit(ApprovalDto dto);
	

}
