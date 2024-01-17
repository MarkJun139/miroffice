package com.group4.miroffice.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Schedule {
	
	private int scheNo;
	private int empNo;
	private int deptNo;
	private Date scheStartDate;
	private Date scheEndDate;
	private String scheTitle;
	private int scheAllday;
	private String scheCategory;
	private String color;
}
