package com.group4.miroffice.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Project {

	private int projectno;
	private int empno;
	private int deptno;	
	private String projecttitle;
	private String projecttext;
	private int projectdiffdate;
	private LocalDate projectstart;
	private LocalDate projectend;
	private int projectpercent;
	
	private String empname; 
	private String deptname;
	
	
}
