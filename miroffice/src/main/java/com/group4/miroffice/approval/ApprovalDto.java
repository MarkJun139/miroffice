package com.group4.miroffice.approval;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class ApprovalDto {
	
	private Integer appNo;
	private int empNo;
	private int deptNo;
	private String appTitle;
	private String appText;
	private Date appDate;

	private Integer appAdmin1;
	private Integer appAdmin2;
	private Integer appAdmin3;
	private Boolean appApprove1;
	private Boolean appApprove2;
	private Boolean appApprove3;
	private Boolean appApprovefinal;
	
	private String empName;
	private String appAppr1;
	private String appAppr2;
	private String appAppr3;
	private String option;



}
