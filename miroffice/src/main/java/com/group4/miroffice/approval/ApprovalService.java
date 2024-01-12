package com.group4.miroffice.approval;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import com.group4.miroffice.config.SecurityUser;
import com.group4.miroffice.user.Users;

@Service
public class ApprovalService {
	@Autowired
	ApprovalDao dao;
	
	public int approvalSubmit(ApprovalDto dto) {
		return dao.approvalSubmit(dto);
	}
	
	public List<ApprovalDto> approvalList(int deptno) {
		return dao.approvalList(deptno);
	}
	
	public List<ApprovalDto> approval(int empno) {
		return dao.approval(empno);
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
