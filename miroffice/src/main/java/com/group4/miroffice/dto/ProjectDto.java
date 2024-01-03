package com.group4.miroffice.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectDto {

	private int project_no;
	private int emp_no;
	private int dept_no;	
	private String project_title;
	private String project_text;
	private LocalDate project_start;
	private LocalDate project_end;
	private int project_percent;
	
	
}
