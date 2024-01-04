package com.group4.miroffice.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ProjectDto {

	private int projectno;
	private int empno;
	private int deptno;	
	private String projecttitle;
	private String projecttext;
	private LocalDate projectstart;
	private LocalDate projectend;
	private int projectpercent;
	
	
}
