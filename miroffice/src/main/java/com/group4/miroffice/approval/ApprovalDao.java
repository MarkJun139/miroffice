package com.group4.miroffice.approval;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApprovalDao {

//	@Select("select * from approval where dept_no = #{deptno}")
	List<ApprovalDto> approvalList(int deptno);
	
	List<ApprovalDto> approvalList2(int empno);
	
	List<ApprovalDto> approvalList3(Map<String, Object> map);
	
	List<ApprovalDto> approvalList4(Map<String, Object> map);
	
	List<ApprovalDto> approvalList5(Map<String, Object> map);
	
	ApprovalDto approvalListOne(int appno);
	
	int approvalSubmit(ApprovalDto dto);
	
	int approvalApprove1(ApprovalDto dto);
	
	int approvalNo(ApprovalDto dto);

	
	int approvalApprovef(ApprovalDto dto);
	
	int approvalApprovefail(ApprovalDto dto);
	
	int adminApprovalWrite(ApprovalDto dto);
	
	int adminApprovalEdit(ApprovalDto dto);
	

}
