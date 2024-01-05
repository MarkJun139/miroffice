package com.group4.miroffice.approval;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class ApprovalDto {

	private int app_admin1;
	private int app_admin2;
	private int app_admin3;
	private boolean app_approve1;
	private boolean app_approve2;
	private boolean app_approve3;
	private boolean app_approvefinal;
	private Date app_date;
	private int app_no;
	private String app_text;
	private String app_title;
	private int dept_no;
	private int emp_no;
	
	private List<Map<String,Object>> dataList;
	private Map<String,Object> headerMap;
}
