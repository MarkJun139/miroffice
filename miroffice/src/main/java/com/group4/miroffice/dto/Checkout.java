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
	private boolean checkOn;
	private boolean checkLeaveEarly;
	private boolean checkHalfoff;
	private boolean checkDayoff;
	private boolean checkVacation;
	private boolean checkLate;
	private boolean checkAbsenteeism;
	
}
