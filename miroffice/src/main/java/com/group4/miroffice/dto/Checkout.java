package com.group4.miroffice.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Checkout {
	
	private int check_no;
	private int emp_no;
	private int dept_no;
	private Date check_date;
	private Date check_start_time;
	private Date check_end_time;
	private int check_work_time;
	private boolean check_on;
	private boolean check_leave_early;
	private boolean check_halfoff;
	private boolean check_dayoff;
	private boolean check_vacation;
	private boolean check_late;
	private boolean check_absenteeism;
	
}
