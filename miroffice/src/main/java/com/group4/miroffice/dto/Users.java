package com.group4.miroffice.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Users {

	private int empno;
	private int deptno;
	private String emppw;
	private String empname;
	private Date emphiredate;
	private String emprank;
	private String empphone;
	private int empsal;
	private String empaddress;
	private String empaddress2;
	private String empemail;
	private Date empbirth;
	private String empphoto;
	private Role emprole;
	private int empdayoff;
	private String empjob;
}
