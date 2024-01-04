package com.group4.miroffice.login;

import java.util.Date;

import lombok.Data;

@Data
public class Users {
	
	private int empNo;
	private int deptNo;
	private String empPw;
	private String empName;
	private Date empHiredate;
	private String empRank;
	private String empPhone;
	private int empSal;
	private String empAddress;
	private String empAddress2;
	private String empEmail;
	private Date empBirth;
	private String empPhoto;
	private Role empRole;
	private int empDayoff;
	private String empJob;
	
}
