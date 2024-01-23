package com.group4.miroffice.approval;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApprovalService {
	@Autowired
	ApprovalDao dao;
	
	public int approvalSubmit(ApprovalDto dto) {
		return dao.approvalSubmit(dto);
	}
	
	public int approvalApprove1(ApprovalDto dto) {
		return dao.approvalApprove1(dto);
	}

	public int approvalApprovef(ApprovalDto dto) {
		return dao.approvalApprovef(dto);
	}
	
	public List<ApprovalDto> approvalList(int deptno) {
		return dao.approvalList(deptno);
	}
	
	public List<ApprovalDto> approvalList2(int empno) {
		return dao.approvalList2(empno);
	}
	
	public List<ApprovalDto> approvalList3(Map<String, Object> map) {
		return dao.approvalList3(map);
	}
	
	public List<ApprovalDto> approvalList4(Map<String, Object> map) {
		return dao.approvalList4(map);
	}

	public List<ApprovalDto> approvalList5(Map<String, Object> map) {
		return dao.approvalList5(map);
	}

	
	public ApprovalDto approvalListOne(int appno){
		return dao.approvalListOne(appno);
	}
	
	public int adminApprovalWrite(ApprovalDto dto) {
		return dao.adminApprovalWrite(dto);
	}
	
	public int adminApprovalEdit(ApprovalDto dto) {
		return dao.adminApprovalEdit(dto);
	}


	
	
}
