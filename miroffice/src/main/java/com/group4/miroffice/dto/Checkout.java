package com.group4.miroffice.dto;

import java.time.LocalDate;
import java.time.LocalTime;

import lombok.Data;

@Data
public class Checkout {
	
	private int checkNo;
	private int empNo;
	private int deptNo;
	private LocalDate checkDate;
	private LocalTime checkStartTime;
	private LocalTime checkEndTime;
	private int checkWorkTime;
	private int checkOn;
	private int checkLeaveEarly;
	private int checkHalfoff;
	private int checkDayoff;
	private int checkVacation;
	private int checkLate;
	private int checkAbsenteeism;
	
}
