package com.group4.miroffice.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Admin {

	private int empNo;
	private int deptNo;
	private String empPw;
	private String empName;
	private String empHiredate;
	private String empJob;
	private String empRank;
	private String empPhone;
	private int empSal;
	private String empAddress;
	private String empAddress2;
	private String empEmail;
	private String empPhoto;
	private String empBirth;
	private Role empRole;
	private int empDayoff;
	
}
