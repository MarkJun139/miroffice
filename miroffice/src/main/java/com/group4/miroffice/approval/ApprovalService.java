package com.group4.miroffice.approval;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApprovalService {
	@Autowired
	ApprovalDao dao;
	
	//public ApprovalDto approvalSubmit(HashMap<String, Object> map) {
		//return dao.approvalSubmit(map);
	//}
	
}
