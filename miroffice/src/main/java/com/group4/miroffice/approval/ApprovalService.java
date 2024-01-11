package com.group4.miroffice.approval;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApprovalService {
	@Autowired
	ApprovalDao dao;
	
	public int approvalSubmit(HashMap<String, Object> map) {
		return dao.approvalSubmit(map);
	}
	
	public List<ApprovalDto> approvalList(int deptno) {
		return dao.approvalList(deptno);
	}
	
	public ApprovalDto approvalListOne(int appno){
		return dao.approvalListOne(appno);
	}
	
	public int adminApprovalWrite(ApprovalDto dto) {
		return dao.adminApprovalWrite(dto);
	}
	
	
	
}
