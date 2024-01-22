package com.group4.miroffice.dto;

import java.time.LocalDate;

import lombok.Data;

@Data
public class DayCheck {
	
	String empNo;
	int deptNo;
	LocalDate checkDate;
	LocalDate checkMonthStart;
	int week;

}
